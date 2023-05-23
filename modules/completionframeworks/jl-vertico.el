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
  :straight (vertico :includes vertico-directory
                     :files (:defaults "extensions/vertico-directory.el"))
  :general (:keymaps 'vertico-map
                     "C-j" 'vertico-next
                     "C-k" 'vertico-previous
                     "C-g" 'vertico-exit
                     "RET" 'vertico-directory-enter
                     "DEL" 'vertico-directory-delete-char
                     "M-DEL" 'vertico-directory-delete-word)
  ;; Tidy shadowed file names
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy)
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode)
  :config
  (setq completion-in-region-function
        (lambda (&rest args)
          (apply (if vertico-mode
                     #'consult-completion-in-region
                   #'completion--in-region)
                 args))))

;;; Marginalia
(use-package marginalia
  :after vertico
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

;;; Consult
(use-package consult
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
  (setq completion-styles '(orderless basic)
        completion-category-overrides '((file (styles basic partial-completion)))))

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
(use-package embark-consult)

;;; Consult-dir
(use-package consult-dir
  :after consult
  :general
  (general-define-key
   :keymaps 'vertico-map
   "C-d" 'consult-dir)
  (jl/SPC-keys
    "fd" 'consult-dir))
