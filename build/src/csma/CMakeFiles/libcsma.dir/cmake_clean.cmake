file(REMOVE_RECURSE
  "../../lib/libns3.38-csma-debug.pdb"
  "../../lib/libns3.38-csma-debug.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/libcsma.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
