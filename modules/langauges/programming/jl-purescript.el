(use-package purescript-mode
  :defer t
  :hook (purescript-mode . purescript-indentation-mode)
  :config
  (modify-syntax-entry ?. "." purescript-mode-syntax-table))

(use-package dhall-mode
  :defer t)

(use-package psci
  :straight (:host github :repo "jeslie0/emacs-psci" :branch "master" :files ("psci.el"))
  :defer t
  :general
  (jl/major-modes
    :keymaps 'purescript-mode-map
    :states '(normal visual operator)
    :major-modes t
    "s" '(:ignore t :which-key "repl")
    "sr" 'psci
    "sb" 'psci/load-module!))
