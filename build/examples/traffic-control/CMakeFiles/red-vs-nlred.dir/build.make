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
include examples/traffic-control/CMakeFiles/red-vs-nlred.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include examples/traffic-control/CMakeFiles/red-vs-nlred.dir/compiler_depend.make

# Include the progress variables for this target.
include examples/traffic-control/CMakeFiles/red-vs-nlred.dir/progress.make

# Include the compile flags for this target's objects.
include examples/traffic-control/CMakeFiles/red-vs-nlred.dir/flags.make

examples/traffic-control/CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.o: examples/traffic-control/CMakeFiles/red-vs-nlred.dir/flags.make
examples/traffic-control/CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.o: /home/bk/workspace/ns-allinone-3.38/ns-3.38/examples/traffic-control/red-vs-nlred.cc
examples/traffic-control/CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.o: CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx
examples/traffic-control/CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.o: CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx.gch
examples/traffic-control/CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.o: examples/traffic-control/CMakeFiles/red-vs-nlred.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/traffic-control/CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.o"
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/examples/traffic-control && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx -MD -MT examples/traffic-control/CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.o -MF CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.o.d -o CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.o -c /home/bk/workspace/ns-allinone-3.38/ns-3.38/examples/traffic-control/red-vs-nlred.cc

examples/traffic-control/CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.i"
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/examples/traffic-control && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx -E /home/bk/workspace/ns-allinone-3.38/ns-3.38/examples/traffic-control/red-vs-nlred.cc > CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.i

examples/traffic-control/CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.s"
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/examples/traffic-control && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx -S /home/bk/workspace/ns-allinone-3.38/ns-3.38/examples/traffic-control/red-vs-nlred.cc -o CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.s

# Object files for target red-vs-nlred
red__vs__nlred_OBJECTS = \
"CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.o"

# External object files for target red-vs-nlred
red__vs__nlred_EXTERNAL_OBJECTS =

examples/traffic-control/ns3.38-red-vs-nlred-debug: examples/traffic-control/CMakeFiles/red-vs-nlred.dir/red-vs-nlred.cc.o
examples/traffic-control/ns3.38-red-vs-nlred-debug: examples/traffic-control/CMakeFiles/red-vs-nlred.dir/build.make
examples/traffic-control/ns3.38-red-vs-nlred-debug: examples/traffic-control/CMakeFiles/red-vs-nlred.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ns3.38-red-vs-nlred-debug"
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/examples/traffic-control && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/red-vs-nlred.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/traffic-control/CMakeFiles/red-vs-nlred.dir/build: examples/traffic-control/ns3.38-red-vs-nlred-debug
.PHONY : examples/traffic-control/CMakeFiles/red-vs-nlred.dir/build

examples/traffic-control/CMakeFiles/red-vs-nlred.dir/clean:
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/examples/traffic-control && $(CMAKE_COMMAND) -P CMakeFiles/red-vs-nlred.dir/cmake_clean.cmake
.PHONY : examples/traffic-control/CMakeFiles/red-vs-nlred.dir/clean

examples/traffic-control/CMakeFiles/red-vs-nlred.dir/depend:
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bk/workspace/ns-allinone-3.38/ns-3.38 /home/bk/workspace/ns-allinone-3.38/ns-3.38/examples/traffic-control /home/bk/workspace/ns-allinone-3.38/ns-3.38/build /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/examples/traffic-control /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/examples/traffic-control/CMakeFiles/red-vs-nlred.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/traffic-control/CMakeFiles/red-vs-nlred.dir/depend

