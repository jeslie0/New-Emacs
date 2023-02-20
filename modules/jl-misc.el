(setq dired-guess-shell-alist-user '(("\\.pdf\\'" "zathura")))
(setq read-process-output-max (* 1024 1024))
(setq-default indent-tabs-mode nil)
(setq vc-follow-symlinks t)
(add-hook 'prog-mode-hook #'electric-pair-local-mode)

