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
include src/wimax/examples/CMakeFiles/wimax-ipv4.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/wimax/examples/CMakeFiles/wimax-ipv4.dir/compiler_depend.make

# Include the progress variables for this target.
include src/wimax/examples/CMakeFiles/wimax-ipv4.dir/progress.make

# Include the compile flags for this target's objects.
include src/wimax/examples/CMakeFiles/wimax-ipv4.dir/flags.make

src/wimax/examples/CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.o: src/wimax/examples/CMakeFiles/wimax-ipv4.dir/flags.make
src/wimax/examples/CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.o: /home/bk/workspace/ns-allinone-3.38/ns-3.38/src/wimax/examples/wimax-ipv4.cc
src/wimax/examples/CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.o: CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx
src/wimax/examples/CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.o: CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx.gch
src/wimax/examples/CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.o: src/wimax/examples/CMakeFiles/wimax-ipv4.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/wimax/examples/CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.o"
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/wimax/examples && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx -MD -MT src/wimax/examples/CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.o -MF CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.o.d -o CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.o -c /home/bk/workspace/ns-allinone-3.38/ns-3.38/src/wimax/examples/wimax-ipv4.cc

src/wimax/examples/CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.i"
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/wimax/examples && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx -E /home/bk/workspace/ns-allinone-3.38/ns-3.38/src/wimax/examples/wimax-ipv4.cc > CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.i

src/wimax/examples/CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.s"
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/wimax/examples && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -Winvalid-pch -include /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles/stdlib_pch_exec.dir/cmake_pch.hxx -S /home/bk/workspace/ns-allinone-3.38/ns-3.38/src/wimax/examples/wimax-ipv4.cc -o CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.s

# Object files for target wimax-ipv4
wimax__ipv4_OBJECTS = \
"CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.o"

# External object files for target wimax-ipv4
wimax__ipv4_EXTERNAL_OBJECTS =

src/wimax/examples/ns3.38-wimax-ipv4-debug: src/wimax/examples/CMakeFiles/wimax-ipv4.dir/wimax-ipv4.cc.o
src/wimax/examples/ns3.38-wimax-ipv4-debug: src/wimax/examples/CMakeFiles/wimax-ipv4.dir/build.make
src/wimax/examples/ns3.38-wimax-ipv4-debug: src/wimax/examples/CMakeFiles/wimax-ipv4.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ns3.38-wimax-ipv4-debug"
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/wimax/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wimax-ipv4.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/wimax/examples/CMakeFiles/wimax-ipv4.dir/build: src/wimax/examples/ns3.38-wimax-ipv4-debug
.PHONY : src/wimax/examples/CMakeFiles/wimax-ipv4.dir/build

src/wimax/examples/CMakeFiles/wimax-ipv4.dir/clean:
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/wimax/examples && $(CMAKE_COMMAND) -P CMakeFiles/wimax-ipv4.dir/cmake_clean.cmake
.PHONY : src/wimax/examples/CMakeFiles/wimax-ipv4.dir/clean

src/wimax/examples/CMakeFiles/wimax-ipv4.dir/depend:
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bk/workspace/ns-allinone-3.38/ns-3.38 /home/bk/workspace/ns-allinone-3.38/ns-3.38/src/wimax/examples /home/bk/workspace/ns-allinone-3.38/ns-3.38/build /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/wimax/examples /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/wimax/examples/CMakeFiles/wimax-ipv4.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/wimax/examples/CMakeFiles/wimax-ipv4.dir/depend

