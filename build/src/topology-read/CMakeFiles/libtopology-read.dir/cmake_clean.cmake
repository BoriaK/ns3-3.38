file(REMOVE_RECURSE
  "../../lib/libns3.38-topology-read-debug.pdb"
  "../../lib/libns3.38-topology-read-debug.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/libtopology-read.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
