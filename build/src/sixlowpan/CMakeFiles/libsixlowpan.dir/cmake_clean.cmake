file(REMOVE_RECURSE
  "../../lib/libns3.38-sixlowpan-debug.pdb"
  "../../lib/libns3.38-sixlowpan-debug.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/libsixlowpan.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
