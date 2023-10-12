(use-package tree-sitter
  :defer t
  :init (global-tree-sitter-mode)
  :config
  (add-to-list 'tree-sitter-major-mode-language-alist '(haskell-mode . haskell))
  (add-to-list 'tree-sitter-major-mode-language-alist '(agda2-mode . agda)))

(setq jl/builtin-treesit '(sh-mode c++-mode c-mode csharp-mode css-mode java-mode js-mode js2-mode rjsx-mode json-mode python-mode typescript-mode))

(use-package tree-sitter-langs
  :defer t
  :after tree-sitter
  :config
  (progn
    (let* ((use-tree-sitter-langs  (mapcar 'car tree-sitter-major-mode-language-alist))
           (tree-sitter-mode-hooks  (mapcar #'(lambda (mode) (intern (concat (symbol-name mode) "-hook"))) (seq-difference use-tree-sitter-langs jl/builtin-treesit))))
      (mapc #'(lambda (hook) (add-hook hook 'tree-sitter-hl-mode)) tree-sitter-mode-hooks))))

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

