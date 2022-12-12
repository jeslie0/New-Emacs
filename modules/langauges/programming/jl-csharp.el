(use-package csharp-mode
  :straight nil
  :defer t
  :config
  (setq lsp-csharp-server-path (executable-find "OmniSharp"))
  :init
  (add-to-list 'auto-mode-alist `("\\.cs\\'" . ,(if (treesit-available-p) 'csharp-ts-mode 'csharp-tree-sitter-mode))))
