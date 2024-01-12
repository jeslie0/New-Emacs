;;; Nerd icons completion

(use-package nerd-icons
  :defer t
  :init
  (add-to-list 'nerd-icons-extension-icon-alist '("purs" nerd-icons-sucicon "nf-seti-purescript" :face nerd-icons-dpurple))
  (add-to-list 'nerd-icons-extension-icon-alist '("lock" nerd-icons-faicon "nf-fa-lock" :face nerd-icons-dred)))

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
