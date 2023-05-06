# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/bk/workspace/ns-allinone-3.38/ns-3.38

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/bk/workspace/ns-allinone-3.38/ns-3.38/build

# Include any dependencies generated for this target.
include src/traffic-control/CMakeFiles/libtraffic-control.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/traffic-control/CMakeFiles/libtraffic-control.dir/compiler_depend.make

# Include the progress variables for this target.
include src/traffic-control/CMakeFiles/libtraffic-control.dir/progress.make

# Include the compile flags for this target's objects.
include src/traffic-control/CMakeFiles/libtraffic-control.dir/flags.make

# Object files for target libtraffic-control
libtraffic__control_OBJECTS =

# External object files for target libtraffic-control
libtraffic__control_EXTERNAL_OBJECTS = \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/helper/queue-disc-container.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/helper/traffic-control-helper.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/cobalt-queue-disc.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/codel-queue-disc.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/fifo-queue-disc.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/fq-cobalt-queue-disc.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/fq-codel-queue-disc.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/fq-pie-queue-disc.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/mq-queue-disc.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/packet-filter.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/pfifo-fast-queue-disc.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/pie-queue-disc.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/queue-disc.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/red-queue-disc.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/tbf-queue-disc.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/traffic-control-layer.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/shared-buffer-queue-disc_v01.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/round-robin-prio-queue-disc.cc.o"

lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/helper/queue-disc-container.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/helper/traffic-control-helper.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/cobalt-queue-disc.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/codel-queue-disc.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/fifo-queue-disc.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/fq-cobalt-queue-disc.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/fq-codel-queue-disc.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/fq-pie-queue-disc.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/mq-queue-disc.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/packet-filter.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/pfifo-fast-queue-disc.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/pie-queue-disc.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/queue-disc.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/red-queue-disc.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/tbf-queue-disc.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/traffic-control-layer.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/shared-buffer-queue-disc_v01.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control-obj.dir/model/round-robin-prio-queue-disc.cc.o
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control.dir/build.make
lib/libns3.38-traffic-control-debug.so: src/traffic-control/CMakeFiles/libtraffic-control.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking CXX shared library ../../lib/libns3.38-traffic-control-debug.so"
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libtraffic-control.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/traffic-control/CMakeFiles/libtraffic-control.dir/build: lib/libns3.38-traffic-control-debug.so
.PHONY : src/traffic-control/CMakeFiles/libtraffic-control.dir/build

src/traffic-control/CMakeFiles/libtraffic-control.dir/clean:
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control && $(CMAKE_COMMAND) -P CMakeFiles/libtraffic-control.dir/cmake_clean.cmake
.PHONY : src/traffic-control/CMakeFiles/libtraffic-control.dir/clean

src/traffic-control/CMakeFiles/libtraffic-control.dir/depend:
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bk/workspace/ns-allinone-3.38/ns-3.38 /home/bk/workspace/ns-allinone-3.38/ns-3.38/src/traffic-control /home/bk/workspace/ns-allinone-3.38/ns-3.38/build /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/traffic-control/CMakeFiles/libtraffic-control.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/traffic-control/CMakeFiles/libtraffic-control.dir/depend

