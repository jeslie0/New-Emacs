(use-package rjsx-mode
  :general
  (jl/major-modes
    :keymaps 'rjsx-mode-map
    :states '(normal visual operator)
    :major-modes t
    "j" 'rjsx-jump-tag
    "r" 'rjsx-rename-tag-at-point)
  :mode ("\\.js\\'" . rjsx-mode)
  :config
  (setq sgml-basic-offset 4))

(use-package xref-js2
  :general
  (jl/major-modes
    :keymaps 'rjsx-mode-map
    :states '(normal visual operator)
    :major-modes t
    "gG" 'xref-find-definitions)
  :config
  (setq xref-js2-search-program 'rg))
(add-hook 'js2-mode-hook (lambda ()
                           (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
