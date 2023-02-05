(use-package hindent
  :after haskell-mode
  :general
  (jl/major-modes
    :states '(normal visual operator)
    :keymaps 'haskell-mode-map
    :major-modes t
    "f" '(:ignore nil :which-key "format")
    "fB" 'hindent-reformat-buffer
    "fd" 'hindent-reformat-decl
    "ff" 'hindent-reformat-decl-or-fill
    "fr" 'hindent-reformat-region)
  :hook (haskell-mode . hindent-mode))

(use-package hlint-refactor
  :hook (haskell-mode . hlint-refactor-mode)
  :general
  (jl/major-modes
    :states '(normal visual)
    :keymaps 'haskell-mode-map
    :major-modes t
    "rb" 'hlint-refactor-refactor-buffer
    "rr" 'hlint-refactor-refactor-at-point))

(use-package cmm-mode
  :defer t)
