file(REMOVE_RECURSE
  "../../lib/libns3.38-aodv-debug.pdb"
  "../../lib/libns3.38-aodv-debug.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/libaodv.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
