(use-package csharp-mode
  :defer t
  :config
  (setq lsp-csharp-server-path (executable-find "OmniSharp"))
  (add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-tree-sitter-mode)))
