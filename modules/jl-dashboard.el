(use-package dashboard
  :general
  (jl/SPC-keys
    :no-autoload t
    "bh" 'buffer-visit-dashboard)
  (:keymaps 'dashboard-mode-map
            :states '(normal motion)
            :no-autoload t
            "j"  'widget-forward
            "k"  'widget-backward)
  :init
  ;; Set the title
  (setq dashboard-banner-logo-title "Welcome to Emacs"
        ;; Set the logo
        dashboard-startup-banner (concat user-emacs-directory "images/EmacsLogo.svg")
        dashboard-image-banner-max-width 300

        ;; Content is not centered by default. To center, set
        dashboard-center-content t
        dashboard-projects-backend 'project-el

        ;; To disable shortcut "jump" indicators for each section, set
        dashboard-show-shortcuts t
        dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-set-init-info t
        dashboard-items '((recents . 5)
		                  (projects . 5)
                          (bookmarks . 5))

        initial-buffer-choice (lambda () (get-buffer "*dashboard*"))
        dashboard-display-icons-p t ;; display icons on both GUI and terminal
        dashboard-icon-type 'nerd-icons ;; use `nerd-icons' package
        dashboard-set-heading-icons t
        dashboard-set-file-icons t)
  :config
  (defun buffer-visit-dashboard ()
    (interactive)
    (switch-to-buffer "*dashboard*")
    (dashboard-refresh-buffer))
  (dashboard-setup-startup-hook)
  (dashboard-refresh-buffer)
  (set-face-attribute 'dashboard-items-face nil :inherit nil :slant 'italic)
  )
