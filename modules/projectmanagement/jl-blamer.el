(use-package blamer
  :defer t
  :general
  (jl/SPC-keys
    "gB" '(:ignore t :which-key "Blamer")
    "gBB" #'blamer-mode
    "gBc" #'blamer-show-commit-info
    "gc" #'blamer-show-commit-info)
  :custom
  (blamer-idle-time 0.3)
  (blamer-min-offset 70)
  :custom-face
  (blamer-face ((t :foreground "#7a88cf"
                   :background nil
                   :italic t))))
