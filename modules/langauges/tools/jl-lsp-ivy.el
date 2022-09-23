(use-package lsp-ivy
  :after (lsp ivy)
  :commands (lsp-ivy-workspace-symbol
             lsp-ivy-global-workspace-symbol)
  :general
  (jl/major-modes
    :keymaps 'lsp-mode-map
    :states '(normal visual motion)
    :major-modes t
    "i"  '(:toggle nil :which-key "lsp-ivy")
    "is" 'lsp-ivy-workspace-symbol
    "iS" 'lsp-ivy-global-workspace-symbol))
