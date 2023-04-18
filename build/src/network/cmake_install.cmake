# Install script for directory: /home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.38-network-debug.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.38-network-debug.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.38-network-debug.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/lib/libns3.38-network-debug.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.38-network-debug.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.38-network-debug.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.38-network-debug.so"
         OLD_RPATH "/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3.38-network-debug.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ns3" TYPE FILE FILES
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/helper/application-container.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/helper/delay-jitter-estimation.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/helper/net-device-container.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/helper/node-container.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/helper/packet-socket-helper.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/helper/simple-net-device-helper.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/helper/trace-helper.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/address.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/application.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/buffer.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/byte-tag-list.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/channel-list.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/channel.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/chunk.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/header.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/net-device.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/nix-vector.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/node-list.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/node.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/packet-metadata.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/packet-tag-list.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/packet.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/socket-factory.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/socket.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/tag-buffer.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/tag.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/model/trailer.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/test/header-serialization-test.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/address-utils.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/bit-deserializer.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/bit-serializer.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/crc32.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/data-rate.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/drop-tail-queue.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/dynamic-queue-limits.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/error-channel.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/error-model.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/ethernet-header.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/ethernet-trailer.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/flow-id-tag.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/generic-phy.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/inet-socket-address.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/inet6-socket-address.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/ipv4-address.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/ipv6-address.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/llc-snap-header.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/lollipop-counter.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/mac16-address.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/mac48-address.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/mac64-address.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/mac8-address.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/net-device-queue-interface.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/output-stream-wrapper.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/packet-burst.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/packet-data-calculators.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/packet-probe.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/packet-socket-address.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/packet-socket-client.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/packet-socket-factory.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/packet-socket-server.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/packet-socket.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/packetbb.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/pcap-file-wrapper.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/pcap-file.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/pcap-test.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/queue-fwd.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/queue-item.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/queue-limits.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/queue-size.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/queue.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/radiotap-header.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/sequence-number.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/simple-channel.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/simple-net-device.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/sll-header.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/src/network/utils/timestamp-tag.h"
    "/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/include/ns3/network-module.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/network/examples/cmake_install.cmake")

endif()

