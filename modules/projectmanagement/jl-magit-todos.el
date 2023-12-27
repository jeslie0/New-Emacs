(use-package magit-todos
  :after magit
  :general
  (jl/SPC-keys
    :states '(normal visual operator)
    "gt" 'magit-todos-list)
  :init
  (magit-todos-mode 1))
