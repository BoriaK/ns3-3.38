file(REMOVE_RECURSE
  "../../lib/libns3.38-config-store-debug.pdb"
  "../../lib/libns3.38-config-store-debug.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/libconfig-store.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
