/*
 * Copyright (c) 2015 Natale Patriciello <natale.patriciello@gmail.com>
 *               2016 Stefano Avallone <stavallo@unina.it>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation;
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "traffic-control-layer.h"

#include "ns3/log.h"
#include "ns3/net-device-queue-interface.h"
#include "ns3/object-map.h"
#include "ns3/packet.h"
#include "ns3/queue-disc.h"
#include "ns3/socket.h"
////////////////////////////////
#include "ns3/names.h"
#include "ns3/queue.h"
#include "ns3/network-module.h"
#include "ns3/point-to-point-module.h"
#include "ns3/string.h"
//////////////////////////////

#include <tuple>
#include <string>

namespace ns3
{

NS_LOG_COMPONENT_DEFINE("TrafficControlLayer");

NS_OBJECT_ENSURE_REGISTERED(TrafficControlLayer);

TypeId
TrafficControlLayer::GetTypeId()
{
    static TypeId tid =
        TypeId("ns3::TrafficControlLayer")
            .SetParent<Object>()
            .SetGroupName("TrafficControl")
            .AddConstructor<TrafficControlLayer>()
            .AddAttribute(
                "RootQueueDiscList",
                "The list of root queue discs associated to this Traffic Control layer.",
                ObjectMapValue(),
                MakeObjectMapAccessor(&TrafficControlLayer::GetNDevices,
                                      &TrafficControlLayer::GetRootQueueDiscOnDeviceByIndex),
                MakeObjectMapChecker<QueueDisc>())
/////Added by me////////////////////////////////////////////////////////////////////
            .AddAttribute("SharedBuffer",
                "True to use Shared-Buffer all packet flows are managed before the queue-disc",
                BooleanValue(true),
                MakeBooleanAccessor(&TrafficControlLayer::m_useSharedBuffer),
                MakeBooleanChecker())
            .AddAttribute("MaxSharedBufferSize",
                   "in case of Shared-Buffer only, The maximum number of packets accepted by traffic-controll layer.",
                  QueueSizeValue(QueueSize("100p")),
                  MakeQueueSizeAccessor(&TrafficControlLayer::m_maxSharedBufferSize),
                  MakeQueueSizeChecker ())
            .AddAttribute ("Alpha_High",
                "The Alpha value for high priority packets",
                UintegerValue(2),
                MakeUintegerAccessor(&TrafficControlLayer::alpha_h),
                MakeUintegerChecker<uint8_t>())
            .AddAttribute ("Alpha_Low",
                        "The Alpha value for low priority packets",
                        UintegerValue(1),
                        MakeUintegerAccessor(&TrafficControlLayer::alpha_l),
                        MakeUintegerChecker<uint8_t>())
            .AddAttribute("TrafficControllAlgorythm",
                        "The Traffic Controll Algorythm to use inorder to manage traffic in Shared Buffer",
                        StringValue("DT"),
                        MakeStringAccessor(&TrafficControlLayer::usedAlgorythm),
                        MakeStringChecker())
            .AddTraceSource("PacketsInQueue",
                            "Number of packets currently stored in the Shared Buffer in Traffic Control Layer",
                            MakeTraceSourceAccessor(&TrafficControlLayer::m_traceSharedBufferPackets),
                            "ns3::TracedValueCallback::Uint32")
            .AddTraceSource("BytesInQueue",
                            "Number of bytes currently stored in the Shared Buffer in Traffic Control Layer",
                            MakeTraceSourceAccessor(&TrafficControlLayer::m_traceSharedBufferBytes),
                            "ns3::TracedValueCallback::Uint32")
            .AddTraceSource("HighPriorityPacketsInQueue",
                            "Number of packets currently stored in the Shared Buffer in Traffic Control Layer",
                            MakeTraceSourceAccessor(&TrafficControlLayer::m_nPackets_trace_High_InSharedQueue),
                            "ns3::TracedValueCallback::Uint32")
            .AddTraceSource("LowPriorityPacketsInQueue",
                            "Number of packets currently stored in the Shared Buffer in Traffic Control Layer",
                            MakeTraceSourceAccessor(&TrafficControlLayer::m_nPackets_trace_Low_InSharedQueue),
                            "ns3::TracedValueCallback::Uint32")
            .AddTraceSource("EnqueueingThreshold_High",
                            "The Threshold for High Priority packets in the Shared Buffer in Traffic Control Layer",
                            MakeTraceSourceAccessor(&TrafficControlLayer::m_p_trace_threshold_h),
                            "ns3::TracedValueCallback::Uint32")
            .AddTraceSource("EnqueueingThreshold_Low",
                            "The Threshold for Low Priority packets in the Shared Buffer in Traffic Control Layer",
                            MakeTraceSourceAccessor(&TrafficControlLayer::m_p_trace_threshold_l),
                            "ns3::TracedValueCallback::Uint32")
            .AddTraceSource("TcDrop",
                            "Trace source indicating a packet has been dropped by the Traffic "
                            "Control layer because no queue disc is installed on the device, the "
                            "device supports flow control and the device queue is stopped",
                            MakeTraceSourceAccessor(&TrafficControlLayer::m_dropped),
                            "ns3::Packet::TracedCallback");
    return tid;
}

TypeId
TrafficControlLayer::GetInstanceTypeId() const
{
    return GetTypeId();
}

TrafficControlLayer::TrafficControlLayer()
    : Object(),
    m_p_threshold_h (m_maxSharedBufferSize.GetValue ()),  // initilize high priority threshold to be max queue size// Added by me
    m_p_threshold_l (m_maxSharedBufferSize.GetValue ())  // initilize low priority threshold to be max queue size// Added by me
{
    NS_LOG_FUNCTION(this);
}

TrafficControlLayer::~TrafficControlLayer()
{
    NS_LOG_FUNCTION(this);
}

void
TrafficControlLayer::DoDispose()
{
    NS_LOG_FUNCTION(this);
    m_node = nullptr;
    m_handlers.clear();
    m_netDevices.clear();
    Object::DoDispose();
}

void
TrafficControlLayer::DoInitialize()
{
    NS_LOG_FUNCTION(this);

    ScanDevices();

    // initialize the root queue discs
    for (auto& ndi : m_netDevices)
    {
        if (ndi.second.m_rootQueueDisc)
        {
            ndi.second.m_rootQueueDisc->Initialize();
        }
    }

    Object::DoInitialize();
}

void
TrafficControlLayer::RegisterProtocolHandler(Node::ProtocolHandler handler,
                                             uint16_t protocolType,
                                             Ptr<NetDevice> device)
{
    NS_LOG_FUNCTION(this << protocolType << device);

    ProtocolHandlerEntry entry;
    entry.handler = handler;
    entry.protocol = protocolType;
    entry.device = device;
    entry.promiscuous = false;

    m_handlers.push_back(entry);

    NS_LOG_DEBUG("Handler for NetDevice: " << device << " registered for protocol " << protocolType
                                           << ".");
}

//////////added by me/////////////////////////////////////
TrafficControlLayer::TCStats::TCStats()
    : nTotalDroppedPackets(0),
      nTotalDroppedPacketsHighPriority (0), // added by me
      nTotalDroppedPacketsLowPriority (0), // added by me
      nTotalDroppedBytes(0),
      nTotalDroppedBytesHighPriority (0), // added by me
      nTotalDroppedBytesLowPriority (0) // added by me
{
}

void
TrafficControlLayer::TCStats::Print(std::ostream& os) const
{
    std::map<std::string, uint32_t>::const_iterator itp;
    std::map<std::string, uint64_t>::const_iterator itb;

    os << std::endl
       << "Packets/Bytes dropped by Traffic Control Layer: " << nTotalDroppedPackets << " / " << nTotalDroppedBytes
       /////////Added by me//////////////////////
       << std::endl << "High Priority Packets/Bytes dropped by Traffic Control Layer: "
                    << nTotalDroppedPacketsHighPriority << " / "
                    << nTotalDroppedBytesHighPriority
       << std::endl << "Low Priority Packets/Bytes dropped by Traffic Control Layer: "
                    << nTotalDroppedPacketsLowPriority << " / "
                    << nTotalDroppedBytesLowPriority;
       /////////////////////////////////////////                     


    os << std::endl;
}

std::ostream&
operator<<(std::ostream& os, const TrafficControlLayer::TCStats& stats)
{
    stats.Print(os);
    return os;
}

QueueSize
TrafficControlLayer::GetMaxSharedBufferSize() const
{
    NS_LOG_FUNCTION(this);

    return m_maxSharedBufferSize;  
}

QueueSize
TrafficControlLayer::GetCurrentSharedBufferSize()
{
    NS_LOG_FUNCTION(this);

    /// Create a vector to hold pointers to all the NetDevices aggrigated to the Node
    std::vector<Ptr<NetDevice>> m_netDevicesList;  // a List containing all the net devices on a speciffic Node
    for (auto const& element : m_netDevices) 
    {
    m_netDevicesList.push_back(element.first);
    }
    
    // for debug: Get the number of NetDevices installed on the Node
    // uint32_t numDevices = m_netDevicesList.size();
    // std::cout << "Number of NetDevices installed on the Node is: " << numDevices << std::endl;

    // calculate the number of the packets in the Shared Buffer as the sum of all packets currently stored on all the NetDevices on the Node:
    // erase the Shared Buffer Packets calcultaion from the previous itteration
    m_sharedBufferPackets = 0;
    m_sharedBufferBytes = 0;

    /// calculate the number of the packets/bytes in the Shared Buffer 
    // start the index from 2 since the first 2 net devices are for Tx Ack packets back to senders in TCP scenario
    Ptr<NetDeviceQueueInterface> devQueueIface;    
    for (size_t i = 2; i < m_netDevicesList.size(); i++)
    {
        Ptr<NetDevice> ndev = m_netDevicesList[i];
        std::map<Ptr<NetDevice>, NetDeviceInfo>::iterator ndi = m_netDevices.find(ndev);
        if (ndi == m_netDevices.end() || !ndi->second.m_rootQueueDisc)  // if no root-queue-disc is installed on the net-device
        {
            Ptr<PointToPointNetDevice> p2pndev = DynamicCast<PointToPointNetDevice>(ndev);
            Ptr<Queue<Packet>> queue = p2pndev->GetQueue();
            trafficControllPacketCounter = queue->GetNPackets();
            trafficControllBytesCounter = queue->GetNBytes();
            m_sharedBufferPackets += trafficControllPacketCounter;
            m_sharedBufferBytes += trafficControllBytesCounter;
        }
        else
        {
            Ptr<QueueDisc> qDisc = ndi->second.m_rootQueueDisc;
            // std::cout << "root queue-disc on net-device: " << ndev << " is: " << qDisc << std::endl;
            trafficControllPacketCounter = qDisc->GetNPackets();
            trafficControllBytesCounter = qDisc->GetNBytes();
            m_sharedBufferPackets += trafficControllPacketCounter;
            m_sharedBufferBytes += trafficControllBytesCounter;
        }

    }

    if (GetMaxSharedBufferSize().GetUnit() == QueueSizeUnit::PACKETS)
    {
        return QueueSize(QueueSizeUnit::PACKETS, m_sharedBufferPackets);
    }
    if (GetMaxSharedBufferSize().GetUnit() == QueueSizeUnit::BYTES)
    {
        return QueueSize(QueueSizeUnit::BYTES, m_sharedBufferBytes);
    }
    NS_ABORT_MSG("Unknown queue size unit");
}

QueueSize
TrafficControlLayer::GetNumOfHighPriorityPacketsInSharedQueue()
{
    NS_LOG_FUNCTION(this);

    /// Create a vector to hold pointers to all the NetDevices aggrigated to the Node
    std::vector<Ptr<NetDevice>> m_netDevicesList;  // a List containing all the net devices on a speciffic Node
    for (auto const& element : m_netDevices) 
    {
    m_netDevicesList.push_back(element.first);
    }

    // calculate the number of the packets in the Shared Buffer as the sum of all packets currently stored on all the NetDevices on the Node:
    // erase the Shared Buffer Packets calcultaion from the previous itteration
    m_nPackets_High_InSharedQueue = 0;
    // m_nBytes_high_InSharedQueue = 0; // not implemented for bytes yet

    /// calculate the number of the packets/bytes in the Shared Buffer 
    // start the index from 2 since the first 2 net devices are for Tx Ack packets back to senders in TCP scenario    
    for (size_t i = 2; i < m_netDevicesList.size(); i++)
    {
        Ptr<NetDevice> ndev = m_netDevicesList[i];
        std::map<Ptr<NetDevice>, NetDeviceInfo>::iterator ndi = m_netDevices.find(ndev);
        if (ndi == m_netDevices.end() || !ndi->second.m_rootQueueDisc)  // if no root-queue-disc is installed on the net-device
        {
            Ptr<PointToPointNetDevice> p2pndev = DynamicCast<PointToPointNetDevice>(ndev);
            Ptr<Queue<Packet>> queue = p2pndev->GetQueue();
            trafficControllPacketCounter = queue->GetNumOfHighPrioPacketsInQueue().GetValue();
            // trafficControllBytesCounter = queue->GetNumOfHighPrioPacketsInQueue().GetValue();  // not implemented for bytes yet
            m_nPackets_High_InSharedQueue += trafficControllPacketCounter;
            // m_nBytes_h_InSharedQueue += trafficControllBytesCounter;  // not implemented for bytes yet
        }
        else
        {
            Ptr<QueueDisc> qDisc = ndi->second.m_rootQueueDisc;
            // std::cout << "root queue-disc on net-device: " << ndev << " is: " << qDisc << std::endl;
            trafficControllPacketCounter = qDisc->GetNumOfHighPrioPacketsInQueue().GetValue();
            // trafficControllBytesCounter = qDisc->GetNumOfHighPrioPacketsInQueue().GetValue();  // not implemented for bytes yet
            m_nPackets_High_InSharedQueue += trafficControllPacketCounter;
            // m_nBytes_h_InSharedQueue += trafficControllBytesCounter;  // not implemented for bytes yet
        }
    }

    if (GetMaxSharedBufferSize().GetUnit() == QueueSizeUnit::PACKETS)
    {
        return QueueSize(QueueSizeUnit::PACKETS, m_nPackets_High_InSharedQueue);
    }
    // if (GetMaxSharedBufferSize().GetUnit() == QueueSizeUnit::BYTES)  // not implemented for bytes yet
    // {
    //     return QueueSize(QueueSizeUnit::BYTES, m_nBytes_h_InSharedQueue);
    // }
    NS_ABORT_MSG("Unknown queue size unit");
}

QueueSize
TrafficControlLayer::GetNumOfLowPriorityPacketsInSharedQueue()
{
    NS_LOG_FUNCTION(this);

    /// Create a vector to hold pointers to all the NetDevices aggrigated to the Node
    std::vector<Ptr<NetDevice>> m_netDevicesList;  // a List containing all the net devices on a speciffic Node
    for (auto const& element : m_netDevices) 
    {
    m_netDevicesList.push_back(element.first);
    }

    // calculate the number of the packets in the Shared Buffer as the sum of all packets currently stored on all the NetDevices on the Node:
    // erase the Shared Buffer Packets calcultaion from the previous itteration
    m_nPackets_Low_InSharedQueue = 0;
    // m_nBytes_low_InSharedQueue = 0;  // not implemented for bytes yet

    /// calculate the number of the packets/bytes in the Shared Buffer 
    // start the index from 2 since the first 2 net devices are for Tx Ack packets back to senders in TCP scenario    
    for (size_t i = 2; i < m_netDevicesList.size(); i++)
    {
        Ptr<NetDevice> ndev = m_netDevicesList[i];
        std::map<Ptr<NetDevice>, NetDeviceInfo>::iterator ndi = m_netDevices.find(ndev);
        if (ndi == m_netDevices.end() || !ndi->second.m_rootQueueDisc)  // if no root-queue-disc is installed on the net-device
        {
            Ptr<PointToPointNetDevice> p2pndev = DynamicCast<PointToPointNetDevice>(ndev);
            Ptr<Queue<Packet>> queue = p2pndev->GetQueue();
            trafficControllPacketCounter = queue->GetNumOfLowPrioPacketsInQueue().GetValue();
            // trafficControllBytesCounter = queue->GetNumOfLowPrioPacketsInQueue().GetValue();  // not implemented for bytes yet
            m_nPackets_Low_InSharedQueue += trafficControllPacketCounter;
            // m_nBytes_l_InSharedQueue += trafficControllBytesCounter;  // not implemented for bytes yet
        }
        else
        {
            Ptr<QueueDisc> qDisc = ndi->second.m_rootQueueDisc;
            // std::cout << "root queue-disc on net-device: " << ndev << " is: " << qDisc << std::endl;
            trafficControllPacketCounter = qDisc->GetNumOfLowPrioPacketsInQueue().GetValue();
            // trafficControllBytesCounter = qDisc->GetNumOfLowPrioPacketsInQueue().GetValue();  // not implemented for bytes yet
            m_nPackets_Low_InSharedQueue += trafficControllPacketCounter;
            // m_nBytes_l_InSharedQueue += trafficControllBytesCounter;  // not implemented for bytes yet
        }
    }

    if (GetMaxSharedBufferSize().GetUnit() == QueueSizeUnit::PACKETS)
    {
        return QueueSize(QueueSizeUnit::PACKETS, m_nPackets_Low_InSharedQueue);
    }
    // if (GetMaxSharedBufferSize().GetUnit() == QueueSizeUnit::BYTES)  // not implemented for bytes yet
    // {
    //     return QueueSize(QueueSizeUnit::BYTES, m_nBytes_low_InSharedQueue);
    // }
    NS_ABORT_MSG("Unknown queue size unit");
}

uint32_t 
TrafficControlLayer::GetNumOfConjestedQueuesInSharedQueue()
{
    NS_LOG_FUNCTION(this);

    /// Create a vector to hold pointers to all the NetDevices aggrigated to the Node
    std::vector<Ptr<NetDevice>> m_netDevicesList;  // a List containing all the net devices on a speciffic Node
    for (auto const& element : m_netDevices) 
    {
    m_netDevicesList.push_back(element.first);
    }

    // calculate the number of the conjested queues in the Shared Buffer as the sum of all non empty queues of priority p on all the NetDevices on the Node:
    // erase the conjested queues calcultaion from the previous itteration
    m_nConjestedQueues = 0;

    /// calculate the number of the qunjested queues of priority p in the Shared Buffer 
    // start the index from 2 since the first 2 net devices are for Tx Ack packets back to senders in TCP scenario
     for (size_t i = 2; i < m_netDevicesList.size(); i++)
    {
        Ptr<NetDevice> ndev = m_netDevicesList[i];
        std::map<Ptr<NetDevice>, NetDeviceInfo>::iterator ndi = m_netDevices.find(ndev);
        if (ndi == m_netDevices.end() || !ndi->second.m_rootQueueDisc)  // if no root-queue-disc is installed on the net-device
        {
            Ptr<PointToPointNetDevice> p2pndev = DynamicCast<PointToPointNetDevice>(ndev);
            Ptr<Queue<Packet>> queue = p2pndev->GetQueue();
            if (queue->GetNPackets())
            {
                m_nConjestedQueues++;
            }
        }
        else
        {
            Ptr<QueueDisc> qDisc = ndi->second.m_rootQueueDisc;
            if (qDisc->GetNPackets())
            {
                m_nConjestedQueues++;
            }
        }
    }
    return m_nConjestedQueues;
}

uint32_t 
TrafficControlLayer::GetNumOfPriorityConjestedQueuesInSharedQueue(uint32_t queue_priority)
{
    NS_LOG_FUNCTION(this);

    /// Create a vector to hold pointers to all the NetDevices aggrigated to the Node
    std::vector<Ptr<NetDevice>> m_netDevicesList;  // a List containing all the net devices on a speciffic Node
    for (auto const& element : m_netDevices) 
    {
    m_netDevicesList.push_back(element.first);
    }

    // calculate the number of the conjested queues in the Shared Buffer as the sum of all non empty queues of priority p on all the NetDevices on the Node:
    // erase the conjested queues calcultaion from the previous itteration
    m_nConjestedQueues_p = 0;

    /// calculate the number of the qunjested queues of priority p in the Shared Buffer 
    // start the index from 2 since the first 2 net devices are for Tx Ack packets back to senders in TCP scenario
     for (size_t i = 2; i < m_netDevicesList.size(); i++)
    {
        Ptr<NetDevice> ndev = m_netDevicesList[i];
        std::map<Ptr<NetDevice>, NetDeviceInfo>::iterator ndi = m_netDevices.find(ndev);
        if (ndi == m_netDevices.end() || !ndi->second.m_rootQueueDisc)  // if no root-queue-disc is installed on the net-device
        {
            Ptr<PointToPointNetDevice> p2pndev = DynamicCast<PointToPointNetDevice>(ndev);
            Ptr<Queue<Packet>> queue = p2pndev->GetQueue();
            if (queue_priority == 1)  // 1 is low priority
            {
                if (queue->GetNumOfLowPrioPacketsInQueue().GetValue())
                {
                    m_nConjestedQueues_p++;
                }
            }
            else if (queue_priority == 2)  // 2 is high priority
            {
                if (queue->GetNumOfHighPrioPacketsInQueue().GetValue())
                {
                    m_nConjestedQueues_p++;
                }
            }
            else
            {
                NS_ABORT_MSG("Unknown priority");
            }
        }
        else
        {
            Ptr<QueueDisc> qDisc = ndi->second.m_rootQueueDisc;
            if (queue_priority == 1)  // 1 is low priority
            {
                if (qDisc->GetNumOfLowPrioPacketsInQueue().GetValue())
                {
                    m_nConjestedQueues_p++;
                }
            }
            else if (queue_priority == 2)  // 2 is high priority
            {
                if (qDisc->GetNumOfHighPrioPacketsInQueue().GetValue())
                {
                    m_nConjestedQueues_p++;
                }
            }
            else
            {
                NS_ABORT_MSG("Unknown priority");
            }
        }
    }
    return m_nConjestedQueues_p;
}

QueueSize
TrafficControlLayer::GetQueueThreshold_DT (int alpha, int alpha_l, int alpha_h)  // added by me!!!!!!!! for DT implementation
{
  NS_LOG_FUNCTION (this);

  if (GetMaxSharedBufferSize().GetUnit() == QueueSizeUnit::PACKETS)
    {
      if (alpha == alpha_h)
      {
        m_p_threshold_h = alpha_h * (GetMaxSharedBufferSize ().GetValue () - GetCurrentSharedBufferSize ().GetValue ());
        return QueueSize (QueueSizeUnit::PACKETS, m_p_threshold_h);
      }
      else if (alpha == alpha_l)
      {
        m_p_threshold_l = alpha_l * (GetMaxSharedBufferSize ().GetValue () - GetCurrentSharedBufferSize ().GetValue ());
        return QueueSize (QueueSizeUnit::PACKETS, m_p_threshold_l);
      }
      
    }
  if (GetMaxSharedBufferSize ().GetUnit () == QueueSizeUnit::BYTES)
    {
      if (alpha == alpha_h)
      {
        m_b_threshold_h = alpha_h * (GetMaxSharedBufferSize ().GetValue () - GetCurrentSharedBufferSize ().GetValue ());
        return QueueSize (QueueSizeUnit::PACKETS, m_b_threshold_h);
      }
      else if (alpha == alpha_l)
      {
        m_p_threshold_l = alpha_l * (GetMaxSharedBufferSize ().GetValue () - GetCurrentSharedBufferSize ().GetValue ());
        return QueueSize (QueueSizeUnit::PACKETS, m_b_threshold_l);
      }
    }
  NS_ABORT_MSG ("Unknown Threshod unit");
}

QueueSize
TrafficControlLayer::GetQueueThreshold_FB (int alpha, int alpha_l, int alpha_h)  // added by me!!!!!!!! for FB implementation
{
    NS_LOG_FUNCTION (this);

    // set condition for FB: if there are ANY packets currently in queue, that queue is conjested!
    numConjestedQueuesHigh = 0;  // initilize to 0 EACH TIME A NEW PACKET ARRIVES
    numConjestedQueuesLow = 0;

    if ((GetNumOfHighPriorityPacketsInSharedQueue().GetValue() == 0) && (GetNumOfLowPriorityPacketsInSharedQueue().GetValue() == 0))  // if queue is compleatly empty -> Threshold should be as high as possible (Infinity)
    {
        if (GetMaxSharedBufferSize().GetUnit() == QueueSizeUnit::PACKETS)
        {
            if (alpha == alpha_h)
            {
                m_p_threshold_h = alpha_h * (GetMaxSharedBufferSize ().GetValue () - GetCurrentSharedBufferSize ().GetValue ());
                return QueueSize (QueueSizeUnit::PACKETS, m_p_threshold_h);
            }
            else if (alpha == alpha_l)
            {
                m_p_threshold_l = alpha_l * (GetMaxSharedBufferSize ().GetValue () - GetCurrentSharedBufferSize ().GetValue ());
                return QueueSize (QueueSizeUnit::PACKETS, m_p_threshold_l);
            }
            
        }
        if (GetMaxSharedBufferSize ().GetUnit () == QueueSizeUnit::BYTES)
        {
            if (alpha == alpha_h)
            {
                m_b_threshold_h = alpha_h * (GetMaxSharedBufferSize ().GetValue () - GetCurrentSharedBufferSize ().GetValue ());
                return QueueSize (QueueSizeUnit::PACKETS, m_b_threshold_h);
            }
            else if (alpha == alpha_l)
            {
                m_p_threshold_l = alpha_l * (GetMaxSharedBufferSize ().GetValue () - GetCurrentSharedBufferSize ().GetValue ());
                return QueueSize (QueueSizeUnit::PACKETS, m_b_threshold_l);
            }
        }
        NS_ABORT_MSG ("Unknown Threshod unit");
    }
    else
    {
        numConjestedQueues = GetNumOfConjestedQueuesInSharedQueue();
        if (GetMaxSharedBufferSize().GetUnit() == QueueSizeUnit::PACKETS)
        {
            // queue_priority = [2, 1]
            if (alpha == alpha_h)
            {
                // numConjestedQueuesHigh = GetNumOfPriorityConjestedQueuesInSharedQueue(2);  // 2 is high 
                numConjestedQueuesHigh = numConjestedQueues;
                m_p_threshold_h = alpha_h * (1 / numConjestedQueuesHigh) * gamma * (GetMaxSharedBufferSize ().GetValue () - GetCurrentSharedBufferSize ().GetValue ());
                return QueueSize (QueueSizeUnit::PACKETS, m_p_threshold_h);
            }
            else if (alpha == alpha_l)
            {
                // numConjestedQueuesLow = GetNumOfPriorityConjestedQueuesInSharedQueue(1);  // 1 is low priority
                numConjestedQueuesLow = numConjestedQueues;
                m_p_threshold_l = alpha_l * (1 / numConjestedQueuesLow) * gamma * (GetMaxSharedBufferSize ().GetValue () - GetCurrentSharedBufferSize ().GetValue ());
                return QueueSize (QueueSizeUnit::PACKETS, m_p_threshold_l);
            }
            
        }
        if (GetMaxSharedBufferSize ().GetUnit () == QueueSizeUnit::BYTES)
        {
            if (alpha == alpha_h)
            {
                // numConjestedQueuesHigh = GetNumOfPriorityConjestedQueuesInSharedQueue(2);  // 2 is high priority
                numConjestedQueuesHigh = numConjestedQueues;
                m_b_threshold_h = std::ceil(alpha_h *(1 / numConjestedQueuesHigh) * gamma * (GetMaxSharedBufferSize ().GetValue () - GetCurrentSharedBufferSize ().GetValue ()));
                return QueueSize (QueueSizeUnit::PACKETS, m_b_threshold_h);
            }
            else if (alpha == alpha_l)
            {
                // numConjestedQueuesLow = GetNumOfPriorityConjestedQueuesInSharedQueue(1);  // 1 is low priority
                numConjestedQueuesLow = numConjestedQueues;
                m_p_threshold_l = std::ceil(alpha_l * (1 / numConjestedQueuesLow) * gamma * (GetMaxSharedBufferSize ().GetValue () - GetCurrentSharedBufferSize ().GetValue ()));
                return QueueSize (QueueSizeUnit::PACKETS, m_b_threshold_l);
            }
        }
        NS_ABORT_MSG ("Unknown Threshod unit");
    }
       
}

const TrafficControlLayer::TCStats&
TrafficControlLayer::GetStats()
{

    return m_stats;
}

void
TrafficControlLayer::DropBeforeEnqueue(Ptr<const QueueDiscItem> item)
{
    NS_LOG_FUNCTION(this << item);

    m_stats.nTotalDroppedPackets++;
    m_stats.nTotalDroppedBytes += item->GetSize();

    if (item->GetPacket ()->PeekPacketTag (flowPrioTag))
        {
        flow_priority = flowPrioTag.GetSimpleValue();
        }
    
    if (flow_priority == 1)
        {
            m_stats.nTotalDroppedPacketsHighPriority++;
            m_stats.nTotalDroppedBytesHighPriority += item->GetSize ();
        }
    else if (flow_priority == 2)
        {
            m_stats.nTotalDroppedPacketsLowPriority++;
            m_stats.nTotalDroppedBytesLowPriority += item->GetSize ();
        }

    NS_LOG_DEBUG ("Total High Priority packets/bytes dropped by Traffic Controll Layer: "
                    << m_stats.nTotalDroppedPacketsHighPriority << " / "
                    << m_stats.nTotalDroppedBytesHighPriority);
    NS_LOG_DEBUG ("Total Low Priority packets/bytes dropped by Traffic Controll Layer: "
                    << m_stats.nTotalDroppedPacketsLowPriority << " / "
                    << m_stats.nTotalDroppedBytesLowPriority);                
    NS_LOG_DEBUG("Total packets/bytes dropped by Traffic Controll Layer: "
                 << m_stats.nTotalDroppedPackets << " / "
                 << m_stats.nTotalDroppedBytes);
    NS_LOG_LOGIC("m_dropped (p)");
    
    m_dropped(item->GetPacket());
}
////////////////////////////////////////////////////////////

void
TrafficControlLayer::ScanDevices()
{
    NS_LOG_FUNCTION(this);

    NS_ASSERT_MSG(m_node, "Cannot run ScanDevices without an aggregated node");

    NS_LOG_DEBUG("Scanning devices on node " << m_node->GetId());
    for (uint32_t i = 0; i < m_node->GetNDevices(); i++)
    {
        NS_LOG_DEBUG("Scanning devices on node " << m_node->GetId());
        Ptr<NetDevice> dev = m_node->GetDevice(i);
        NS_LOG_DEBUG("Checking device " << i << " with pointer " << dev << " of type "
                                        << dev->GetInstanceTypeId().GetName());

        // note: there may be no NetDeviceQueueInterface aggregated to the device
        Ptr<NetDeviceQueueInterface> ndqi = dev->GetObject<NetDeviceQueueInterface>();
        NS_LOG_DEBUG("Pointer to NetDeviceQueueInterface: " << ndqi);

        std::map<Ptr<NetDevice>, NetDeviceInfo>::iterator ndi = m_netDevices.find(dev);

        if (ndi != m_netDevices.end())
        {
            NS_LOG_DEBUG("Device entry found; installing NetDeviceQueueInterface pointer "
                         << ndqi << " to internal map");
            ndi->second.m_ndqi = ndqi;
        }
        else if (ndqi)
        // if no entry for the device is found, it means that no queue disc has been
        // installed. Nonetheless, create an entry for the device and store a pointer
        // to the NetDeviceQueueInterface object if the latter is not null, because
        // the Traffic Control layer checks whether the device queue is stopped even
        // when there is no queue disc.
        {
            NS_LOG_DEBUG("No device entry found; create entry for device and store pointer to "
                         "NetDeviceQueueInterface: "
                         << ndqi);
            m_netDevices[dev] = {nullptr, ndqi, QueueDiscVector()};
            ndi = m_netDevices.find(dev);
        }

        // if a queue disc is installed, set the wake callbacks on netdevice queues
        if (ndi != m_netDevices.end() && ndi->second.m_rootQueueDisc)
        {
            NS_LOG_DEBUG("Setting the wake callbacks on NetDevice queues");
            ndi->second.m_queueDiscsToWake.clear();

            if (ndqi)
            {
                for (std::size_t i = 0; i < ndqi->GetNTxQueues(); i++)
                {
                    Ptr<QueueDisc> qd;

                    if (ndi->second.m_rootQueueDisc->GetWakeMode() == QueueDisc::WAKE_ROOT)
                    {
                        qd = ndi->second.m_rootQueueDisc;
                    }
                    else if (ndi->second.m_rootQueueDisc->GetWakeMode() == QueueDisc::WAKE_CHILD)
                    {
                        NS_ABORT_MSG_IF(ndi->second.m_rootQueueDisc->GetNQueueDiscClasses() !=
                                            ndqi->GetNTxQueues(),
                                        "The number of child queue discs does not match the number "
                                        "of netdevice queues");

                        qd = ndi->second.m_rootQueueDisc->GetQueueDiscClass(i)->GetQueueDisc();
                    }
                    else
                    {
                        NS_ABORT_MSG("Invalid wake mode");
                    }

                    ndqi->GetTxQueue(i)->SetWakeCallback(MakeCallback(&QueueDisc::Run, qd));
                    ndi->second.m_queueDiscsToWake.push_back(qd);
                }
            }
            else
            {
                ndi->second.m_queueDiscsToWake.push_back(ndi->second.m_rootQueueDisc);
            }

            // set the NetDeviceQueueInterface object and the SendCallback on the queue discs
            // into which packets are enqueued and dequeued by calling Run
            for (auto& q : ndi->second.m_queueDiscsToWake)
            {
                q->SetNetDeviceQueueInterface(ndqi);
                q->SetSendCallback([dev](Ptr<QueueDiscItem> item) {
                    dev->Send(item->GetPacket(), item->GetAddress(), item->GetProtocol());
                });
            }
        }
    }
}

void
TrafficControlLayer::SetRootQueueDiscOnDevice(Ptr<NetDevice> device, Ptr<QueueDisc> qDisc)
{
    NS_LOG_FUNCTION(this << device << qDisc);

    std::map<Ptr<NetDevice>, NetDeviceInfo>::iterator ndi = m_netDevices.find(device);

    if (ndi == m_netDevices.end())
    {
        // No entry found for this device. Create one.
        m_netDevices[device] = {qDisc, nullptr, QueueDiscVector()};
    }
    else
    {
        NS_ABORT_MSG_IF(ndi->second.m_rootQueueDisc,
                        "Cannot install a root queue disc on a device already having one. "
                        "Delete the existing queue disc first.");

        ndi->second.m_rootQueueDisc = qDisc;
    }
}

Ptr<QueueDisc>
TrafficControlLayer::GetRootQueueDiscOnDevice(Ptr<NetDevice> device) const
{
    NS_LOG_FUNCTION(this << device);

    std::map<Ptr<NetDevice>, NetDeviceInfo>::const_iterator ndi = m_netDevices.find(device);

    if (ndi == m_netDevices.end())
    {
        return nullptr;
    }
    return ndi->second.m_rootQueueDisc;
}

Ptr<QueueDisc>
TrafficControlLayer::GetRootQueueDiscOnDeviceByIndex(uint32_t index) const
{
    NS_LOG_FUNCTION(this << index);
    return GetRootQueueDiscOnDevice(m_node->GetDevice(index));
}

void
TrafficControlLayer::DeleteRootQueueDiscOnDevice(Ptr<NetDevice> device)
{
    NS_LOG_FUNCTION(this << device);

    std::map<Ptr<NetDevice>, NetDeviceInfo>::iterator ndi = m_netDevices.find(device);

    NS_ASSERT_MSG(ndi != m_netDevices.end() && ndi->second.m_rootQueueDisc,
                  "No root queue disc installed on device " << device);

    // remove the root queue disc
    ndi->second.m_rootQueueDisc = nullptr;
    for (auto& q : ndi->second.m_queueDiscsToWake)
    {
        q->SetNetDeviceQueueInterface(nullptr);
        q->SetSendCallback(nullptr);
    }
    ndi->second.m_queueDiscsToWake.clear();

    Ptr<NetDeviceQueueInterface> ndqi = ndi->second.m_ndqi;
    if (ndqi)
    {
        // remove configured callbacks, if any
        for (std::size_t i = 0; i < ndqi->GetNTxQueues(); i++)
        {
            ndqi->GetTxQueue(i)->SetWakeCallback(MakeNullCallback<void>());
        }
    }
    else
    {
        // remove the empty entry
        m_netDevices.erase(ndi);
    }
}

void
TrafficControlLayer::SetNode(Ptr<Node> node)
{
    NS_LOG_FUNCTION(this << node);
    m_node = node;
}

void
TrafficControlLayer::NotifyNewAggregate()
{
    NS_LOG_FUNCTION(this);
    if (!m_node)
    {
        Ptr<Node> node = this->GetObject<Node>();
        // verify that it's a valid node and that
        // the node was not set before
        if (node)
        {
            this->SetNode(node);
        }
    }
    Object::NotifyNewAggregate();
}

uint32_t
TrafficControlLayer::GetNDevices() const
{
    return m_node->GetNDevices();
}

void
TrafficControlLayer::Receive(Ptr<NetDevice> device,
                             Ptr<const Packet> p,
                             uint16_t protocol,
                             const Address& from,
                             const Address& to,
                             NetDevice::PacketType packetType)
{
    NS_LOG_FUNCTION(this << device << p << protocol << from << to << packetType);

    bool found = false;

    for (ProtocolHandlerList::iterator i = m_handlers.begin(); i != m_handlers.end(); i++)
    {
        if (!i->device || (i->device == device))
        {
            if (i->protocol == 0 || i->protocol == protocol)
            {
                NS_LOG_DEBUG("Found handler for packet " << p << ", protocol " << protocol
                                                         << " and NetDevice " << device
                                                         << ". Send packet up");
                i->handler(device, p, protocol, from, to, packetType);
                found = true;
            }
        }
    }

    NS_ABORT_MSG_IF(!found,
                    "Handler for protocol " << p << " and device " << device
                                            << " not found. It isn't forwarded up; it dies here.");
}

void
TrafficControlLayer::Send(Ptr<NetDevice> device, Ptr<QueueDiscItem> item)
{
    NS_LOG_FUNCTION(this << device << item);

    NS_LOG_DEBUG("Send packet to device " << device << " protocol number " << item->GetProtocol());

    Ptr<NetDeviceQueueInterface> devQueueIface;
    std::map<Ptr<NetDevice>, NetDeviceInfo>::iterator ndi = m_netDevices.find(device);

    if (ndi != m_netDevices.end())
    {
        devQueueIface = ndi->second.m_ndqi;
    }

    // determine the transmission queue of the device where the packet will be enqueued
    std::size_t txq = 0;
    if (devQueueIface && devQueueIface->GetNTxQueues() > 1)
    {
        txq = devQueueIface->GetSelectQueueCallback()(item);
        // otherwise, Linux determines the queue index by using a hash function
        // and associates such index to the socket which the packet belongs to,
        // so that subsequent packets of the same socket will be mapped to the
        // same tx queue (__netdev_pick_tx function in net/core/dev.c). It is
        // pointless to implement this in ns-3 because currently the multi-queue
        // devices provide a select queue callback
    }

    NS_ASSERT(!devQueueIface || txq < devQueueIface->GetNTxQueues());

    if (ndi == m_netDevices.end() || !ndi->second.m_rootQueueDisc)
    {
        // The device has no attached queue disc, thus add the header to the packet and
        // send it directly to the device if the selected queue is not stopped
        item->AddHeader();
        if (!devQueueIface || !devQueueIface->GetTxQueue(txq)->IsStopped())
        {
            // a single queue device makes no use of the priority tag
            if (!devQueueIface || devQueueIface->GetNTxQueues() == 1)
            {
                SocketPriorityTag priorityTag;
                item->GetPacket()->RemovePacketTag(priorityTag);
            }
            
            if (m_useSharedBuffer)  // if user choses to activate Shared-Buffer algorythem
            {
                ///for Shared Buffer. in case no queue-disc is installed on the NetDevice////////
                // std::cout << "SharedBuffer, No QueueDisc" << std::endl;

                std::string nodeName = Names::FindName(m_node);  // Get the name of the Node
                // std::cout << "Node Name is: " << nodeName << std::endl; 
                if (nodeName.compare("Router") == 0)
                {
                    // for debug:
                    std::cout << "Node Name is: " << nodeName << std::endl;
                    // std::cout << "Packet: " << item->GetPacket() << " is sent to Port on NetDevice: " << device << std::endl;
                    std::cout << "Current Shared Buffer size is " << GetCurrentSharedBufferSize().GetValue() << " out of: " << GetMaxSharedBufferSize().GetValue() << std::endl;

                    // for tracing
                    m_traceSharedBufferPackets = GetCurrentSharedBufferSize().GetValue();
                    m_nPackets_trace_High_InSharedQueue = GetNumOfHighPriorityPacketsInSharedQueue().GetValue();
                    m_nPackets_trace_Low_InSharedQueue = GetNumOfLowPriorityPacketsInSharedQueue().GetValue();
                    
                    Ptr<PointToPointNetDevice> p2pndev = DynamicCast<PointToPointNetDevice>(device);
                    Ptr<Queue<Packet>> queue = p2pndev->GetQueue();
                    
                    // for debug:
                    // std::cout << "Number of High Priority packets in shared-queue on port: " << device << " is: " << queue->GetNumOfHighPrioPacketsInQueue() << std::endl;
                    // std::cout << "Number of Low Priority packets in shared-queue on port: " << device << " is: " << queue->GetNumOfLowPrioPacketsInQueue() << std::endl;

                    // set a besic Packet clasification based on arbitrary Tag from recieved packet:
                    // flow_priority = 1 is high priority, flow_priority = 2 is low priority

                    if (item->GetPacket ()->PeekPacketTag (flowPrioTag))
                        {
                        flow_priority = flowPrioTag.GetSimpleValue();
                        }
                    
                    // std::cout << "Num of congested queues " << GetNumOfPriorityConjestedQueuesInSharedQueue(flow_priority) << std::endl;
                    
                    // perform enqueueing process based on incoming flow priority 
                    if (flow_priority == 1)
                    {
                        alpha = alpha_h;
                        if (usedAlgorythm.compare("DT") == 0)
                        {
                            if (queue->GetNumOfHighPrioPacketsInQueue().GetValue() < GetQueueThreshold_DT(alpha, alpha_l, alpha_h).GetValue())
                            // if (GetNumOfHighPriorityPacketsInSharedQueue().GetValue() < GetQueueThreshold_DT(alpha, alpha_l, alpha_h).GetValue())
                            {
                                m_p_trace_threshold_h = GetQueueThreshold_DT(alpha, alpha_l, alpha_h).GetValue();  // for tracing
                                // std::cout << "number of packets in queue on net-device: " << device << " is: " << queue->GetNPackets() << std::endl;
                                // std::cout << "Number of High Priority packets in queue on net-device: " << device << " is: " << queue->GetNumOfHighPrioPacketsInQueue() << std::endl;
                                device->Send(item->GetPacket(), item->GetAddress(), item->GetProtocol());
                            }
                            else
                            {
                                std::cout << "High Priority packet was dropped by Shared-Buffer" << std::endl;
                                DropBeforeEnqueue(item);
                            }
                        }
                        else if (usedAlgorythm.compare("FB") == 0)
                        {
                            // for debug:
                            // std::cout << "Num of High Priority congested queues " << GetNumOfPriorityConjestedQueuesInSharedQueue(2) << std::endl;
                            // std::cout << "Num of Low Priority congested queues " << GetNumOfPriorityConjestedQueuesInSharedQueue(1) << std::endl;
                            std::cout << "Num of total congested queues " << GetNumOfConjestedQueuesInSharedQueue() << std::endl;

                            if (queue->GetNumOfHighPrioPacketsInQueue().GetValue() < GetQueueThreshold_FB(alpha, alpha_l, alpha_h).GetValue())
                            // if (GetNumOfHighPriorityPacketsInSharedQueue().GetValue() < GetQueueThreshold_FB(alpha, alpha_l, alpha_h).GetValue())
                            {
                                m_p_trace_threshold_h = GetQueueThreshold_FB(alpha, alpha_l, alpha_h).GetValue();  // for tracing
                                // std::cout << "number of packets in queue on net-device: " << device << " is: " << queue->GetNPackets() << std::endl;
                                // std::cout << "Number of High Priority packets in queue on net-device: " << device << " is: " << queue->GetNumOfHighPrioPacketsInQueue() << std::endl;
                                device->Send(item->GetPacket(), item->GetAddress(), item->GetProtocol());
                            }
                            else
                            {
                                std::cout << "High Priority packet was dropped by Shared-Buffer" << std::endl;
                                DropBeforeEnqueue(item);
                            }
                        }
                        else
                        {
                            NS_ABORT_MSG("unrecognised traffic management algorythm " << usedAlgorythm);
                        }  
                    }
                    else
                    {
                        alpha = alpha_l;
                        if (usedAlgorythm.compare("DT") == 0)
                        {
                            if (queue->GetNumOfLowPrioPacketsInQueue().GetValue() < GetQueueThreshold_DT(alpha, alpha_l, alpha_h).GetValue())
                            // if (GetNumOfLowPriorityPacketsInSharedQueue().GetValue() < GetQueueThreshold_DT(alpha, alpha_l, alpha_h).GetValue())
                            {
                                m_p_trace_threshold_l = GetQueueThreshold_DT(alpha, alpha_l, alpha_h).GetValue();  // for tracing
                                // std::cout << "number of packets in queue on net-device: " << device << " is: " << queue->GetNPackets() << std::endl;
                                // std::cout << "Number of Low Priority packets in queue on net-device: " << device << " is: " << queue->GetNumOfLowPrioPacketsInQueue() << std::endl;
                                device->Send(item->GetPacket(), item->GetAddress(), item->GetProtocol());
                            }
                            else
                            {
                                std::cout << "Low Priority packet was dropped by Shared-Buffer" << std::endl;
                                DropBeforeEnqueue(item);
                            }
                        }
                        else if (usedAlgorythm.compare("FB") == 0)
                        {
                            if (queue->GetNumOfLowPrioPacketsInQueue().GetValue() < GetQueueThreshold_FB(alpha, alpha_l, alpha_h).GetValue())
                            // if (GetNumOfLowPriorityPacketsInSharedQueue().GetValue() < GetQueueThreshold_FB(alpha, alpha_l, alpha_h).GetValue())
                            {
                                m_p_trace_threshold_l = GetQueueThreshold_FB(alpha, alpha_l, alpha_h).GetValue();  // for tracing
                                // std::cout << "number of packets in queue on net-device: " << device << " is: " << queue->GetNPackets() << std::endl;
                                // std::cout << "Number of Low Priority packets in queue on net-device: " << device << " is: " << queue->GetNumOfLowPrioPacketsInQueue() << std::endl;
                                device->Send(item->GetPacket(), item->GetAddress(), item->GetProtocol());
                            }
                            else
                            {
                                std::cout << "Low Priority packet was dropped by Shared-Buffer" << std::endl;
                                DropBeforeEnqueue(item);
                            }
                        }
                        else
                        {
                            NS_ABORT_MSG("unrecognised traffic management algorythm " << usedAlgorythm);
                        }
                    }
                }
                //////////////////////////////////////////////////////////////////////////////////
                else // if not router
                {
                    device->Send(item->GetPacket(), item->GetAddress(), item->GetProtocol());
                }
            }
            else // if Shared Buffer was not selected
            {
                device->Send(item->GetPacket(), item->GetAddress(), item->GetProtocol());
            }
        }
        else
        {
            m_dropped(item->GetPacket());
        }
    }
    else  // if there's a queue-disc installed on the net-device
    {
        // Enqueue the packet in the queue disc associated with the netdevice queue
        // selected for the packet and try to dequeue packets from such queue disc
        item->SetTxQueueIndex(txq);

        Ptr<QueueDisc> qDisc = ndi->second.m_queueDiscsToWake[txq];
        NS_ASSERT(qDisc);

        if (m_useSharedBuffer)
        {
            ///for Shared Buffer.
            // std::cout << "SharedBuffer, QueueDisc" << std::endl;

            std::string nodeName = Names::FindName(m_node);  // Get the name of the Node
            // std::cout << "Node Name is: " << nodeName << std::endl;
            if (nodeName.compare("Router") == 0)
            {
                // for debug:
                std::cout << "Node Name is: " << nodeName << std::endl;
                
                std::cout << "Current Shared Buffer size is " << GetCurrentSharedBufferSize().GetValue() << 
                            " out of: " << GetMaxSharedBufferSize().GetValue() << std::endl;
                
                // for tracing
                m_traceSharedBufferPackets = GetCurrentSharedBufferSize().GetValue();
                m_nPackets_trace_High_InSharedQueue = GetNumOfHighPriorityPacketsInSharedQueue().GetValue();
                m_nPackets_trace_Low_InSharedQueue = GetNumOfLowPriorityPacketsInSharedQueue().GetValue();
                
                // set a besic Packet clasification based on arbitrary Tag from recieved packet:
                // flow_priority = 1 is high priority, flow_priority = 2 is low priority

                if (item->GetPacket ()->PeekPacketTag (flowPrioTag))
                    {
                    flow_priority = flowPrioTag.GetSimpleValue();
                    }

                // perform enqueueing process based on incoming flow priority
                if (flow_priority == 1)
                {
                    alpha = alpha_h;
                    if (usedAlgorythm.compare("DT") == 0)
                    {
                        if (qDisc->GetNumOfHighPrioPacketsInQueue().GetValue() < GetQueueThreshold_DT(alpha, alpha_l, alpha_h).GetValue())
                        // if (GetNumOfHighPriorityPacketsInSharedQueue().GetValue() < GetQueueThreshold_DT(alpha, alpha_l, alpha_h).GetValue())
                        {
                            m_p_trace_threshold_h = GetQueueThreshold_DT(alpha, alpha_l, alpha_h).GetValue();  // for tracing
                            // std::cout << "number of packets in queue on net-device: " << device << " is: " << queue->GetNPackets() << std::endl;
                            // std::cout << "Number of High Priority packets in queue on net-device: " << device << " is: " << queue->GetNumOfHighPrioPacketsInQueue() << std::endl;
                            qDisc->Enqueue(item);
                            qDisc->Run();
                        }
                        else
                        {
                            std::cout << "High Priority packet was dropped by Shared-Buffer" << std::endl;
                            DropBeforeEnqueue(item);
                        }
                    }
                    else if (usedAlgorythm.compare("FB") == 0)
                    {
                        // for debug:
                        std::cout << "Num of total congested queues " << GetNumOfConjestedQueuesInSharedQueue() << std::endl;

                        if (qDisc->GetNumOfHighPrioPacketsInQueue().GetValue() < GetQueueThreshold_FB(alpha, alpha_l, alpha_h).GetValue())
                        // if (GetNumOfHighPriorityPacketsInSharedQueue().GetValue() < GetQueueThreshold_FB(alpha, alpha_l, alpha_h).GetValue())
                        {
                            m_p_trace_threshold_h = GetQueueThreshold_FB(alpha, alpha_l, alpha_h).GetValue();  // for tracing
                            // std::cout << "number of packets in queue on net-device: " << device << " is: " << queue->GetNPackets() << std::endl;
                            // std::cout << "Number of High Priority packets in queue on net-device: " << device << " is: " << queue->GetNumOfHighPrioPacketsInQueue() << std::endl;
                            qDisc->Enqueue(item);
                            qDisc->Run();
                        }
                        else
                        {
                            std::cout << "High Priority packet was dropped by Shared-Buffer" << std::endl;
                            DropBeforeEnqueue(item);
                        }
                    }
                    else
                    {
                        NS_ABORT_MSG("unrecognised traffic management algorythm " << usedAlgorythm);
                    }
                }
                else
                {
                    alpha = alpha_l;
                    if (usedAlgorythm.compare("DT") == 0)
                    {
                        if (qDisc->GetNumOfLowPrioPacketsInQueue().GetValue() < GetQueueThreshold_DT(alpha, alpha_l, alpha_h).GetValue())
                        {
                            m_p_trace_threshold_l = GetQueueThreshold_DT(alpha, alpha_l, alpha_h).GetValue();  // for tracing
                            qDisc->Enqueue(item);
                            qDisc->Run();
                        }
                        else
                        {
                            std::cout << "Low Priority packet was dropped by Shared-Buffer" << std::endl;
                            DropBeforeEnqueue(item);
                        }
                    }
                    else if (usedAlgorythm.compare("FB") == 0)
                    {
                        // for debug:
                        std::cout << "Num of total congested queues " << GetNumOfConjestedQueuesInSharedQueue() << std::endl;

                        if (qDisc->GetNumOfLowPrioPacketsInQueue().GetValue() < GetQueueThreshold_FB(alpha, alpha_l, alpha_h).GetValue())
                        {
                            m_p_trace_threshold_l = GetQueueThreshold_FB(alpha, alpha_l, alpha_h).GetValue();  // for tracing
                            qDisc->Enqueue(item);
                            qDisc->Run();
                        }
                        else
                        {
                            std::cout << "Low Priority packet was dropped by Shared-Buffer" << std::endl;
                            DropBeforeEnqueue(item);
                        }
                    }
                    else
                    {
                        NS_ABORT_MSG("unrecognised traffic management algorythm " << usedAlgorythm);
                    }
                }
            }
            else  // for a node that's not the router
            {
                // Enqueue the packet in the queue disc associated with the netdevice queue
                // selected for the packet and try to dequeue packets from such queue disc
                item->SetTxQueueIndex(txq);

                Ptr<QueueDisc> qDisc = ndi->second.m_queueDiscsToWake[txq];
                NS_ASSERT(qDisc);
                qDisc->Enqueue(item);
                qDisc->Run();
            }
            
        }
        else  // if shared buffer is not used
        {
        // Enqueue the packet in the queue disc associated with the netdevice queue
        // selected for the packet and try to dequeue packets from such queue disc
        item->SetTxQueueIndex(txq);

        Ptr<QueueDisc> qDisc = ndi->second.m_queueDiscsToWake[txq];
        NS_ASSERT(qDisc);
        qDisc->Enqueue(item);
        qDisc->Run();
        }
    }
}

} // namespace ns3
