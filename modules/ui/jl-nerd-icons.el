;;; Nerd icons completion

(use-package nerd-icons
  :defer t)

(use-package nerd-icons-dired
  :defer t
  :hook (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-completion
  :after (marginalia)
  :hook (marginalia-mode . nerd-icons-completion-marginalia-setup)
  :init
  (nerd-icons-completion-mode))

(use-package treemacs-nerd-icons
  :after (treemacs)
  :config
  (treemacs-load-theme "nerd-icons"))
