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
  :hook (js2-mode . (lambda () (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
  :general
  (jl/major-modes
    :keymaps 'rjsx-mode-map
    :states '(normal visual operator)
    :major-modes t
    "g"  '(:ignore t :which-key "goto")
    "gg" 'xref-find-definitions
    "gr" 'xref-find-references
    "ga" 'xref-find-apropos)
  :config
  (setq xref-js2-search-program 'rg))

