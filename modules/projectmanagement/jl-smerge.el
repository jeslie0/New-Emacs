(use-package smerge-mode
  :defer t
  :general
  (jl/SPC-keys
    "gm" '(:ignore t :which-key "smerge"
    "gm=" '(:ignore t :which-key "Diff")))
  (jl/SPC-keys
    :prefix "SPC g m"
    :prefix-map 'smerge-basic-map))
