file(REMOVE_RECURSE
  "../../lib/libns3.38-mobility-debug.pdb"
  "../../lib/libns3.38-mobility-debug.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/libmobility.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
