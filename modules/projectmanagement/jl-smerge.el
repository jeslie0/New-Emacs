(use-package smerge-mode
  :general
  (jl/SPC-keys
    "gm" '(:ignore t :which-key "smerge"
    "gm=" '(:ignore t :which-key "Diff")))
  (jl/SPC-keys
    :prefix "SPC g m"
    :prefix-map 'smerge-basic-map))
