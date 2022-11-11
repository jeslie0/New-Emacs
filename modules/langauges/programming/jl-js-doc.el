(use-package js-doc
  :after (:any js-mode rjsx-mode)
  :general
  (jl/major-modes
    :keymaps '(js-mode-map rjsx-mode-map)
    :states '(normal visual operator)
    :major-modes t
    "i" '(:ignore t :which-key "insert")
    "if" 'js-doc-insert-function-doc
    "it" 'js-doc-insert-tag))
