(use-package jinx
  :hook (emacs-startup . global-jinx-mode)
  :general
  (jl/SPC-keys
    "ss" #'jinx-correct)
  )
