(use-package evil-iedit-state
  :defer t
  :general
  (jl/SPC-keys
    "S" '(:ignore t :which-key "Iedit")
    "Se" 'iedit-mode))

(use-package wgrep
  :general
  (jl/major-modes
    :keymaps 'grep-mode-map
    :states '(normal visual operator)
    :major-modes t
    "a" 'wgrep-abort-changes
    "w" 'wgrep-change-to-wgrep-mode
    "e" 'wgrep-exit
    "f" 'wgrep-finish-edit
    "d" 'wgrep-mark-deletion
    "R" 'wgrep-remove-all-change
    "r" 'wgrep-remove-change
    "s" 'wgrep-save-all-buffers
    "t" 'wgrep-toggle-readonly-area)

  (jl/SPC-keys
    "Sw" 'wgrep-change-to-wgrep-mode))
