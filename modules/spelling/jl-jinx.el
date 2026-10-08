(use-package jinx
  :hook (emacs-startup . global-jinx-mode)
  :general
  (jl/SPC-keys
    "s" '(:ignore t :which-key "spelling")
    "ss" #'jinx-correct)
  )
