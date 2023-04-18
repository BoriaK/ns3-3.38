file(REMOVE_RECURSE
  "../../lib/libns3.38-wifi-debug.pdb"
  "../../lib/libns3.38-wifi-debug.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/libwifi.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
