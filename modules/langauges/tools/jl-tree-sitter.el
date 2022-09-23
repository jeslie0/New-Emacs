(use-package tree-sitter
  :defer t
  ;; :hook ((() . tree-sitter-mode)
  ;;        (() . tree-sitter-hl-mode))
  :config
  (add-to-list 'tree-sitter-major-mode-language-alist '(haskell-mode . haskell)))

(use-package tree-sitter-langs
  :defer t
  :after tree-sitter)

(use-package evil-tree-edit
  :defer t
  :after tree-sitter)

(use-package tree-sitter-indent
  :defer t
  :after tree-sitter)

(use-package ts-fold
  :straight (ts-fold :type git :host github :repo "emacs-tree-sitter/ts-fold"))
