(use-package openwith
  :after (dired vertico)
  :config
  (setq openwith-associations '(("\\.pdf\\'" "zathura" (file))
                                ))

  (openwith-mode))

(use-package mm-util
  :straight gnus
  :config
  (add-to-list 'mm-inhibit-file-name-handlers 'openwith-file-handler))
