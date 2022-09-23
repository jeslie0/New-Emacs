(use-package projectile
  :diminish projectile-mode
  :general
  (jl/SPC-keys
    "p" '(:ignore t :which-key "projectile")
    ;; Project
    "p!" 'projectile-run-shell-command-in-root
    "p&" 'projectile-run-async-shell-command-in-root
    "p%" 'projectile-replace-regexp
    "pa" 'projectile-toggle-between-implementation-and-test
    ;; "pb" 'projectile-switch-to-buffer
    "pc" 'projectile-compile-project
    ;; "pd" 'projectile-find-dir
    "pD" 'projectile-dired
    "pe" 'projectile-edit-dir-locals
    ;; "pf" 'projectile-find-file
    "pF" 'projectile-find-file-dwim
    "pg" 'projectile-find-tag
    "pG" 'projectile-regenerate-tags
    "pI" 'projectile-invalidate-cache
    "pk" 'projectile-kill-buffers
    ;; "pp" 'projectile-switch-project
    ;; "pr" 'projectile-recentf
    "pR" 'projectile-replace
    "pT" 'projectile-test-project
    "pv" 'projectile-vc)
  :init
  (projectile-mode))

(use-package consult-projectile
  ;; :after (consult projectile)
  :straight (consult-projectile :type git :host gitlab :repo "OlMon/consult-projectile" :branch "master")
  :general
  (jl/SPC-keys
    "pf" 'consult-projectile-find-file
    "pd" 'consult-projectile-find-dir
    "pr" 'consult-projectile-recentf
    "pp" 'consult-projectile-switch-project
    "pb" 'consult-projectile-switch-to-buffer
    "pP" 'consult-projectile))
