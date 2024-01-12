(use-package skewer-mode
  :defer t
  :hook ((js2-mode rjsx-mode js-mode js-ts-mode) . skewer-mode)
  :general
  (jl/major-modes
    :keymaps 'skewer-mode-map
    :states '(normal visual operator)
    ;; :major-modes t
    "s"  '(:ignore t :which-key "skewer")
    "sr" #'skewer-repl
    "sl" #'skewer-load-buffer
    "ss" #'run-skewer
    "sd" #'skewer-eval-defun
    "se" #'skewer-eval-last-expression))
