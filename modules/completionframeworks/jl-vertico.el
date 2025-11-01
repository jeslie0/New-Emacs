(defun minibuffer-backward-kill (arg)
  "When minibuffer is completing a file name delete up to parent
folder, otherwise delete a character backward"
  (interactive "p")
  (if minibuffer-completing-file-name
      ;; Borrowed from https://github.com/raxod502/selectrum/issues/498#issuecomment-803283608
      (if (string-match-p "/." (minibuffer-contents))
          (zap-up-to-char (- arg) ?/)
        (delete-minibuffer-contents))
      (delete-backward-char arg)))

(use-package vertico
  :general (:keymaps 'vertico-map
                     "C-j" 'vertico-next
                     "C-k" 'vertico-previous
                     "C-g" 'vertico-exit)
  :custom
  (vertico-cycle t)
  (vertico-sort-function 'vertico-sort-history-alpha)
  :init
  (vertico-mode)
  :config
  (setq completion-in-region-function
        (lambda (&rest args)
          (apply (if vertico-mode
                     #'consult-completion-in-region
                   #'completion--in-region)
                 args)))
  )

(use-package vertico-directory
  :straight (:host github :repo "minad/vertico" :files ("extensions/vertico-directory.el"))
  :after vertico
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy)
  )

;;; Marginalia
(use-package marginalia
  :after vertico
  ;; :custom
  ;; (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

;;; Consult
(use-package consult
  :defer t
  :general
  ("C-s" 'consult-line)
  (jl/SPC-keys
    "SPC" '(execute-extended-command :which-key "M-x")
    "C-s" 'consult-imenu
    "m"  'consult-minor-mode-menu
    "ff" '(find-file :which-key "find file")
    "tt" '(consult-theme :which-key "choose theme")
    "bb" 'persp-switch-to-buffer*
    "/"  'consult-ripgrep)
  (jl/major-modes
    :keymaps 'org-mode-map
    :states '(normal visual operator)
    :major-modes t
    "C-s" 'consult-org-heading)
  :config
  (defadvice consult-theme (after run-after-load-theme-hook activate)
    "Run `after-load-theme-hook'."
    (run-hooks 'after-load-theme-hook)))

;;; Orderless
(use-package orderless
  :defer t
  :after vertico
  :init
  (setq completion-styles '(orderless basic substring partial-completion flex)
        completion-category-overrides '((file (styles basic partial-completion)))
        completion-category-defaults nil ;; Disable defaults, use our settings
        read-file-name-completion-ignore-case t
        read-buffer-completion-ignore-case t
        completion-ignore-case t
        completion-pcm-leading-wildcard t
        ))

;;; Savehist
(use-package savehist
  :after vertico
  :init
  (savehist-mode))

;;; App launcher
(use-package app-launcher
  :defer t
  :straight '(app-launcher :host github :repo "SebastienWae/app-launcher")
  :commands (app-launcher-run-app)
  :general
  (jl/SPC-keys
    "RET" 'app-launcher-run-app))

;;; Embark
(use-package embark
  :defer t
  :commands
  (embark-act
   embark-dwim
   embark-bindings)
  :general
  ("C-." 'embark-act
   "M-."  'embark-dwim
   "C-h B" 'embark-bindings)
  :custom
  (prefix-help-command #'embark-prefix-help-command))

;;; Embark-consult
(use-package embark-consult
  :after embark)

;;; Consult-dir
(use-package consult-dir
  :defer t
  :general
  (general-define-key
   :keymaps 'vertico-map
   "C-d" 'consult-dir)
  (jl/SPC-keys
    "fd" 'consult-dir))
