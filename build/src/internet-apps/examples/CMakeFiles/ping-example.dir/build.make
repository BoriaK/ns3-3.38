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
include src/internet-apps/examples/CMakeFiles/ping-example.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/internet-apps/examples/CMakeFiles/ping-example.dir/compiler_depend.make

# Include the progress variables for this target.
include src/internet-apps/examples/CMakeFiles/ping-example.dir/progress.make

# Include the compile flags for this target's objects.
include src/internet-apps/examples/CMakeFiles/ping-example.dir/flags.make

src/internet-apps/examples/CMakeFiles/ping-example.dir/ping-example.cc.o: src/internet-apps/examples/CMakeFiles/ping-example.dir/flags.make
src/internet-apps/examples/CMakeFiles/ping-example.dir/ping-example.cc.o: /home/bk/workspace/ns-allinone-3.38/ns-3.38/src/internet-apps/examples/ping-example.cc
src/internet-apps/examples/CMakeFiles/ping-example.dir/ping-example.cc.o: CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx
src/internet-apps/examples/CMakeFiles/ping-example.dir/ping-example.cc.o: CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx.gch
src/internet-apps/examples/CMakeFiles/ping-example.dir/ping-example.cc.o: src/internet-apps/examples/CMakeFiles/ping-example.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/internet-apps/examples/CMakeFiles/ping-example.dir/ping-example.cc.o"
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/internet-apps/examples && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx -MD -MT src/internet-apps/examples/CMakeFiles/ping-example.dir/ping-example.cc.o -MF CMakeFiles/ping-example.dir/ping-example.cc.o.d -o CMakeFiles/ping-example.dir/ping-example.cc.o -c /home/bk/workspace/ns-allinone-3.38/ns-3.38/src/internet-apps/examples/ping-example.cc

src/internet-apps/examples/CMakeFiles/ping-example.dir/ping-example.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ping-example.dir/ping-example.cc.i"
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/internet-apps/examples && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx -E /home/bk/workspace/ns-allinone-3.38/ns-3.38/src/internet-apps/examples/ping-example.cc > CMakeFiles/ping-example.dir/ping-example.cc.i

src/internet-apps/examples/CMakeFiles/ping-example.dir/ping-example.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ping-example.dir/ping-example.cc.s"
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/internet-apps/examples && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx -S /home/bk/workspace/ns-allinone-3.38/ns-3.38/src/internet-apps/examples/ping-example.cc -o CMakeFiles/ping-example.dir/ping-example.cc.s

# Object files for target ping-example
ping__example_OBJECTS = \
"CMakeFiles/ping-example.dir/ping-example.cc.o"

# External object files for target ping-example
ping__example_EXTERNAL_OBJECTS =

src/internet-apps/examples/ns3.38-ping-example-debug: src/internet-apps/examples/CMakeFiles/ping-example.dir/ping-example.cc.o
src/internet-apps/examples/ns3.38-ping-example-debug: src/internet-apps/examples/CMakeFiles/ping-example.dir/build.make
src/internet-apps/examples/ns3.38-ping-example-debug: src/internet-apps/examples/CMakeFiles/ping-example.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ns3.38-ping-example-debug"
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/internet-apps/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ping-example.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/internet-apps/examples/CMakeFiles/ping-example.dir/build: src/internet-apps/examples/ns3.38-ping-example-debug
.PHONY : src/internet-apps/examples/CMakeFiles/ping-example.dir/build

src/internet-apps/examples/CMakeFiles/ping-example.dir/clean:
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/internet-apps/examples && $(CMAKE_COMMAND) -P CMakeFiles/ping-example.dir/cmake_clean.cmake
.PHONY : src/internet-apps/examples/CMakeFiles/ping-example.dir/clean

src/internet-apps/examples/CMakeFiles/ping-example.dir/depend:
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bk/workspace/ns-allinone-3.38/ns-3.38 /home/bk/workspace/ns-allinone-3.38/ns-3.38/src/internet-apps/examples /home/bk/workspace/ns-allinone-3.38/ns-3.38/build /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/internet-apps/examples /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/internet-apps/examples/CMakeFiles/ping-example.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/internet-apps/examples/CMakeFiles/ping-example.dir/depend

