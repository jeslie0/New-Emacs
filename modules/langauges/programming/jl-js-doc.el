(use-package js-doc
  :after (:any js-mode rjsx-mode)
  :general
  (jl/major-modes
    :keymaps '(js-mode rjsx-mode)
    :states '(normal visual operator)
    :major-modes t
    "if" 'js-doc-insert-function-doc
    "it" 'js-doc-insert-tag))
