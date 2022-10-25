(use-package treemacs
  :commands (treemacs)
  :general
  (jl/SPC-keys

    "T" '(:ignore t :which-key "Treemacs")
    "0"  'treemacs-select-window
    "ft" 'treemacs)

  (jl/SPC-keys
    :prefix "SPC T"

    "a" 'treemacs-add-project-to-workspace
    "d" 'treemacs-remove-project-from-workspace
    "r" 'treemacs-rename-project

    "c" '(:ignore t :which-key "collapse")
    "ca" 'treemacs-collapse-all-projects
    "cp" 'treemacs-collapse-project
    "cP" 'treemacs-collapse-other-projects

    "w" '(:ignore t :which-key "workspace")
    "wc" 'treemacs-create-workspace
    "wd" 'treemacs-remove-workspace
    "we" 'treemacs-edit-workspaces
    "wf" 'treemacs-set-fallback-workspace
    "wn" 'treemacs-next-workspace
    "wr" 'treemacs-rename-workspace
    "ws" 'treemacs-switch-workspace)

  (jl/major-modes
    :keymaps 'treemacs-mode-map
    :states '(normal visual operator)
    :major-modes t
    "a" 'treemacs-add-project-to-workspace
    "d" 'treemacs-remove-project-from-workspace
    "r" 'treemacs-rename-project

    "c" '(:ignore t :which-key "collapse")
    "ca" 'treemacs-collapse-all-projects
    "cp" 'treemacs-collapse-project
    "cP" 'treemacs-collapse-other-projects

    "w" '(:ignore t :which-key "workspace")
    "wc" 'treemacs-create-workspace
    "wd" 'treemacs-remove-workspace
    "we" 'treemacs-edit-workspaces
    "wf" 'treemacs-set-fallback-workspace
    "wn" 'treemacs-next-workspace
    "wr" 'treemacs-rename-workspace
    "ws" 'treemacs-switch-workspace)
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :custom
  ;; (treemacs-collapse-dirs                 (if treemacs-python-executable 3 0))
  (treemacs-deferred-git-apply-delay      0.5)
  (treemacs-directory-name-transformer    #'identity)
  (treemacs-display-in-side-window        t)
  (treemacs-eldoc-display                 t)
  (treemacs-file-event-delay              5000)
  (treemacs-file-extension-regex          treemacs-last-period-regex-value)
  (treemacs-file-follow-delay             0.2)
  (treemacs-file-name-transformer         #'identity)
  (treemacs-follow-after-init             t)
  (treemacs-expand-after-init             t)
  (treemacs-git-command-pipe              "")
  (treemacs-goto-tag-strategy             'refetch-index)
  (treemacs-indentation                   1)
  (treemacs-indentation-string            " ")
  (treemacs-is-never-other-window         nil)
  (treemacs-max-git-entries               5000)
  (treemacs-missing-project-action        'ask)
  (treemacs-move-forward-on-expand        nil)
  (treemacs-no-png-images                 nil)
  (treemacs-no-delete-other-windows       t)
  (treemacs-project-follow-cleanup        nil)
  (treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory))
  (treemacs-position                      'left)
  (treemacs-read-string-input             'from-child-frame)
  (treemacs-recenter-distance             0.1)
  (treemacs-recenter-after-file-follow    nil)
  (treemacs-recenter-after-tag-follow     nil)
  (treemacs-recenter-after-project-jump   'always)
  (treemacs-recenter-after-project-expand 'on-distance)
  (treemacs-litter-directories            '("/node_modules" "/.venv" "/.cask"))
  (treemacs-show-cursor                   nil)
  (treemacs-show-hidden-files             t)
  (treemacs-silent-filewatch              nil)
  (treemacs-silent-refresh                nil)
  (treemacs-sorting                       'alphabetic-asc)
  (treemacs-space-between-root-nodes      t)
  (treemacs-tag-follow-cleanup            t)
  (treemacs-tag-follow-delay              1.5)
  (treemacs-user-mode-line-format         nil)
  (treemacs-user-header-line-format       nil)
  (treemacs-width                         35)
  (treemacs-workspace-switch-cleanup      nil)
  ;; The default width and height of the icons is 22 pixels. If you are
  ;; using a Hi-DPI display, uncomment this to double the icon size.
  ;; (treemacs-resize-icons 44)
  :config
  (progn (treemacs-follow-mode t)
         ;; (treemacs-indent-guide-mode t)
         (treemacs-git-commit-diff-mode t)
         (treemacs-filewatch-mode t)
         (treemacs-fringe-indicator-mode 'always)
         (pcase (cons (not (null (executable-find "git")))
                      (not (null treemacs-python-executable)))
           (`(t . t)
            (treemacs-git-mode 'deferred))
           (`(t . _)
            (treemacs-git-mode 'simple)))

         (treemacs-hide-gitignored-files-mode nil)))

;;; Treemacs Evil
(use-package treemacs-evil
  :defer t
  :after (treemacs evil))

;;; Treemacs Icons Dired
(use-package treemacs-icons-dired
  :defer t
  :after (treemacs dired)
  :config (treemacs-icons-dired-mode))

;;; Treemacs All The Icons
(use-package treemacs-all-the-icons
  :after (treemacs all-the-icons)
  :hook ((treemacs-mode dired-mode) . (lambda ()
					(treemacs-load-theme 'all-the-icons))))
