# CMAKE generated file: DO NOT EDIT!
# Generated by CMake Version 3.24
cmake_policy(SET CMP0009 NEW)

# single_source_file_scratches at scratch/CMakeLists.txt:57 (file)
file(GLOB NEW_GLOB LIST_DIRECTORIES true "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/[^.]*.cc")
set(OLD_GLOB
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/2In2Out_P2P_v01.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/2In2Out_P2P_v01_SharedBufferQueueDisc.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/2In2Out_P2P_v01_SharedBuffer_TrafficControl_via_FIFO.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/2In2Out_P2P_v01_SharedBuffer_TrafficControl_via_NetDevice.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/Incast_multiple_nodes_NOT_UPDATED.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/Incast_v01_2Nodes.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/Line_P2P_v01_PFIFOQueueDisc.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/Line_P2P_v01_RoundRobinPrioQueueDisc.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/ProducePlots_v01.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/ProducePlots_v02.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/my_LeafSpineTopology_v01.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/my_TrafficControl_Line_v01.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/my_dumbellTopology_v01.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/scratch-simulator.cc"
  )
if(NOT "${NEW_GLOB}" STREQUAL "${OLD_GLOB}")
  message("-- GLOB mismatch!")
  file(TOUCH_NOCREATE "/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles/cmake.verify_globs")
endif()

# scratch_sources at scratch/CMakeLists.txt:88 (file)
file(GLOB NEW_GLOB LIST_DIRECTORIES true "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/nested-subdir/lib/[^.]*.cc")
set(OLD_GLOB
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/nested-subdir/lib/scratch-nested-subdir-library-source.cc"
  )
if(NOT "${NEW_GLOB}" STREQUAL "${OLD_GLOB}")
  message("-- GLOB mismatch!")
  file(TOUCH_NOCREATE "/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles/cmake.verify_globs")
endif()

# scratch_sources at scratch/CMakeLists.txt:88 (file)
file(GLOB NEW_GLOB LIST_DIRECTORIES true "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/subdir/[^.]*.cc")
set(OLD_GLOB
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/subdir/scratch-subdir-additional-header.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/subdir/scratch-subdir.cc"
  )
if(NOT "${NEW_GLOB}" STREQUAL "${OLD_GLOB}")
  message("-- GLOB mismatch!")
  file(TOUCH_NOCREATE "/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles/cmake.verify_globs")
endif()

# scratch_subdirectories at scratch/CMakeLists.txt:64 (file)
file(GLOB_RECURSE NEW_GLOB LIST_DIRECTORIES true "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/**")
set(OLD_GLOB
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/.gitignore"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/2In2Out_P2P_v01.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/2In2Out_P2P_v01_SharedBufferQueueDisc.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/2In2Out_P2P_v01_SharedBuffer_TrafficControl_via_FIFO.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/2In2Out_P2P_v01_SharedBuffer_TrafficControl_via_NetDevice.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/CMakeLists.txt"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/Incast_multiple_nodes_NOT_UPDATED.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/Incast_v01_2Nodes.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/Line_P2P_v01_PFIFOQueueDisc.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/Line_P2P_v01_RoundRobinPrioQueueDisc.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/ProducePlots_v01.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/ProducePlots_v02.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/my_LeafSpineTopology_v01.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/my_TrafficControl_Line_v01.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/my_dumbellTopology_v01.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/nested-subdir"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/nested-subdir/CMakeLists.txt"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/nested-subdir/lib"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/nested-subdir/lib/scratch-nested-subdir-library-header.h"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/nested-subdir/lib/scratch-nested-subdir-library-source.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/nested-subdir/scratch-nested-subdir-executable.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/scratch-simulator.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/subdir"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/subdir/scratch-subdir-additional-header.cc"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/subdir/scratch-subdir-additional-header.h"
  "/home/bk/workspace/ns-allinone-3.38/ns-3.38/scratch/subdir/scratch-subdir.cc"
  )
if(NOT "${NEW_GLOB}" STREQUAL "${OLD_GLOB}")
  message("-- GLOB mismatch!")
  file(TOUCH_NOCREATE "/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles/cmake.verify_globs")
endif()
