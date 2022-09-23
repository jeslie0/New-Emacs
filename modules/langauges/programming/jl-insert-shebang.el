(use-package insert-shebang
  :general
  (jl/major-modes
    :keymaps 'sh-mode-map
    :states '(normal visual operator)
    :major-modes t
    "i!" 'insert-shebang))
