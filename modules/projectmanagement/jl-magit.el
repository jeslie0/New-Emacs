(use-package magit
  :commands (magit-status magit-blame)
  :general
  (jl/SPC-keys
    "g" '(:ignore t :which-key "git/vc")
    "gb" 'magit-blame
    "gs" 'magit-status)
  :config
  (evil-define-minor-mode-key 'normal 'git-commit-mode ",," 'with-editor-finish)
  (evil-define-minor-mode-key 'normal 'git-commit-mode ",a" 'with-editor-cancel))
