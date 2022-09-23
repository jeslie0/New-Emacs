(use-package vc
  :general
  (jl/SPC-keys
    :prefix-map 'vc-prefix-map
    :prefix "SPC g v")
  (jl/SPC-keys
    "gv" '(:ignore t :which-key "VC")
    "gvM" '(:ignore t :which-key "Mergebase")))
