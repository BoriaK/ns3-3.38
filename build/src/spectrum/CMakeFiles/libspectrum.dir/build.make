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
include src/spectrum/CMakeFiles/libspectrum.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/spectrum/CMakeFiles/libspectrum.dir/compiler_depend.make

# Include the progress variables for this target.
include src/spectrum/CMakeFiles/libspectrum.dir/progress.make

# Include the compile flags for this target's objects.
include src/spectrum/CMakeFiles/libspectrum.dir/flags.make

# Object files for target libspectrum
libspectrum_OBJECTS =

# External object files for target libspectrum
libspectrum_EXTERNAL_OBJECTS = \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/helper/adhoc-aloha-noack-ideal-phy-helper.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/helper/spectrum-analyzer-helper.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/helper/spectrum-helper.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/helper/tv-spectrum-transmitter-helper.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/helper/waveform-generator-helper.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/aloha-noack-mac-header.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/aloha-noack-net-device.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/constant-spectrum-propagation-loss.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/friis-spectrum-propagation-loss.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/half-duplex-ideal-phy-signal-parameters.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/half-duplex-ideal-phy.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/matrix-based-channel-model.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/microwave-oven-spectrum-value-helper.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/two-ray-spectrum-propagation-loss-model.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/multi-model-spectrum-channel.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/non-communicating-net-device.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/single-model-spectrum-channel.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-analyzer.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-channel.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-converter.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-error-model.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-interference.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-model-300kHz-300GHz-log.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-model-ism2400MHz-res1MHz.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-model.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-phy.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-propagation-loss-model.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/phased-array-spectrum-propagation-loss-model.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-signal-parameters.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-value.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/three-gpp-channel-model.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/three-gpp-spectrum-propagation-loss-model.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/trace-fading-loss-model.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/tv-spectrum-transmitter.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/waveform-generator.cc.o" \
"/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum-obj.dir/model/wifi-spectrum-value-helper.cc.o"

lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/helper/adhoc-aloha-noack-ideal-phy-helper.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/helper/spectrum-analyzer-helper.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/helper/spectrum-helper.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/helper/tv-spectrum-transmitter-helper.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/helper/waveform-generator-helper.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/aloha-noack-mac-header.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/aloha-noack-net-device.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/constant-spectrum-propagation-loss.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/friis-spectrum-propagation-loss.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/half-duplex-ideal-phy-signal-parameters.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/half-duplex-ideal-phy.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/matrix-based-channel-model.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/microwave-oven-spectrum-value-helper.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/two-ray-spectrum-propagation-loss-model.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/multi-model-spectrum-channel.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/non-communicating-net-device.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/single-model-spectrum-channel.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-analyzer.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-channel.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-converter.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-error-model.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-interference.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-model-300kHz-300GHz-log.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-model-ism2400MHz-res1MHz.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-model.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-phy.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-propagation-loss-model.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/phased-array-spectrum-propagation-loss-model.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-signal-parameters.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/spectrum-value.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/three-gpp-channel-model.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/three-gpp-spectrum-propagation-loss-model.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/trace-fading-loss-model.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/tv-spectrum-transmitter.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/waveform-generator.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum-obj.dir/model/wifi-spectrum-value-helper.cc.o
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum.dir/build.make
lib/libns3.38-spectrum-debug.so: src/spectrum/CMakeFiles/libspectrum.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bk/workspace/ns-allinone-3.38/ns-3.38/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking CXX shared library ../../lib/libns3.38-spectrum-debug.so"
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libspectrum.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/spectrum/CMakeFiles/libspectrum.dir/build: lib/libns3.38-spectrum-debug.so
.PHONY : src/spectrum/CMakeFiles/libspectrum.dir/build

src/spectrum/CMakeFiles/libspectrum.dir/clean:
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum && $(CMAKE_COMMAND) -P CMakeFiles/libspectrum.dir/cmake_clean.cmake
.PHONY : src/spectrum/CMakeFiles/libspectrum.dir/clean

src/spectrum/CMakeFiles/libspectrum.dir/depend:
	cd /home/bk/workspace/ns-allinone-3.38/ns-3.38/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bk/workspace/ns-allinone-3.38/ns-3.38 /home/bk/workspace/ns-allinone-3.38/ns-3.38/src/spectrum /home/bk/workspace/ns-allinone-3.38/ns-3.38/build /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum /home/bk/workspace/ns-allinone-3.38/ns-3.38/build/src/spectrum/CMakeFiles/libspectrum.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/spectrum/CMakeFiles/libspectrum.dir/depend

