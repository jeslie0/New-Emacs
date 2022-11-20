(use-package tree-sitter
  :defer t
  :config
  (add-to-list 'tree-sitter-major-mode-language-alist '(haskell-mode . haskell))
  (add-to-list 'tree-sitter-major-mode-language-alist '(agda2-mode . agda)))

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
  :defer t
  :after tree-sitter
  :straight (ts-fold :type git :host github :repo "emacs-tree-sitter/ts-fold"))
