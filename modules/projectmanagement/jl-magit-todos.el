(use-package magit-todos
  :defer t
  :general
  (jl/SPC-keys
    :states '(normal visual operator)
    "gt" 'magit-todos-list)
  :init
  (magit-todos-mode 1))
