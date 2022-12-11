;;; Functions
(defun find-emacs-dotfile ()
  "Edit the `dotfile', in the current window."
  (interactive)
  (find-file-existing (concat user-emacs-directory "ReadMe.org")))

(defun find-emacs-config ()
  "Edit the `dotfile', in the current window."
  (interactive)
  (find-file-existing (concat user-emacs-directory "config.el")))

(defun find-system-dotfile ()
  "Edit the `dotfile', in the current window."
  (interactive)
  (find-file-existing "~/.dotfiles/ReadMe.org"))


(defun delete-file-and-buffer ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (if (yes-or-no-p
           (format "Are you sure you want to delete this file: '%s'?" name))
          (progn
            (delete-file filename t)
            (kill-buffer buffer)
            (when (projectile-project-p))
              (call-interactively #'projectile-invalidate-cache))
            (message "File deleted: '%s'" filename))
        (message "Canceled: File deletion"))))

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

;;; general.el
(use-package general
  :custom
  (general-override-states '(insert emacs hybrid normal visual motion operator replace))
  :config
  (general-auto-unbind-keys)
  (general-create-definer jl/SPC-keys :states '(normal visual motion) :keymaps 'override :prefix "SPC")
  (general-create-definer jl/major-modes :states '(normal visual motion) :prefix ",")
  (general-create-definer jl/lsp-keys :states '(normal visual motion) :prefix ".")

  (general-create-definer jl/C-c-keys :states '(normal visual insert emacs operator motion) :prefix "C-c")
  (jl/SPC-keys
    "a"  '(:ignore t :which-key "applications")
    "ae" '(:ignore t :which-key "email")
    "ar" '(:ignore t :which-key "readers")
    "as" '(:ignore t :which-key "shells")
    "at" '(:ignore t :which-key "tools")
    "b"  '(:ignore t :which-key "buffers")

    "e"  '(:ignore t :which-key "elisp")
    "f"  '(:which-key "files")
    "fe" '(:which-key "Emacs")
    "h"  '(:ignore t :which-key "help")

    "i"  '(:ignore t :which-key "insertion")
    "j"  '(:ignore t :which-key "jump")

    "q"  '(:ignore t :which-key "quit")
    "t"  '(:ignore t :which-key "toggles")
    "w"  '(:ignore t :which-key "windows")

    "C"  '(:ignore t :which-key "Capture/Colours")

    "!" 'eshell
    "fc" 'copy-file
    "fD" 'delete-file-and-buffer
    "fed" '(find-emacs-dotfile :which-key "Open init file")
    "fec" 'find-emacs-config
    "fnd" '(find-system-dotfile :which-key "Open dotfiles")
    "fR" 'rename-file-and-buffer
    "fs" 'save-buffer
    "qq" 'kill-emacs
    "ts" '(hydra-text-scale/body :which-key "scale text")
    "w-" 'split-window-below
    "w/" 'split-window-right
    "wd" 'delete-window))


(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(general-define-key
 :states 'normal
 "p" 'consult-yank-pop
 "C-r" 'undo-tree-redo
 "u" 'undo-tree-undo)

;;; Hydra

(use-package hydra
  :defer t
  :init
  (defhydra hydra-text-scale (:hint nil) ;;(:timeout 4) ;; -- I don't want a timeout
    "
^Increase^    ^Decrease^    ^Reset
^^^^^------------------------------
[_+_]         [_-_]         [_0_]
[_k_]         [_j_]         ^
"
    ;; Increase
    ("k" text-scale-increase)
    ("+" text-scale-increase)

    ;; Decrease
    ("j" text-scale-decrease)
    ("-" text-scale-decrease)

    ;; Reset
    ("0" (text-scale-adjust 0))
    ("f" nil "finished" :exit t))

  (defhydra jl/pasting-hydra ()
    "Pasting Transient State"
    ("C-j" evil-paste-pop)
    ("C-k" evil-paste-pop-next)
    ("p" evil-paste-after)
    ("P" evil-paste-before))

  (general-define-key
   :states 'normal
   "p"  'jl/pasting-hydra/evil-paste-after))

;;; Evil
(use-package evil
  ;; :defer .1
  :custom
  (evil-want-keybinding nil)
  (evil-normal-state-cursor '("#DAA520" box))
  (evil-insert-state-cursor '("#50FA7B" bar))
  :config
  (evil-mode 1)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal)
  (define-key evil-insert-state-map (kbd "C-k") nil))

(use-package evil-collection
  :diminish t
  :after (evil)
  :config
  (evil-collection-init))

(use-package evil-commentary
  :diminish t
  :after (evil)
  :config
  (evil-commentary-mode 1))

(use-package evil-surround
  :after (evil)
  :config
  (global-evil-surround-mode 1))

(use-package evil-escape
  :diminish t
  :after (evil)
  :config
  (evil-escape-mode)
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2))

(use-package evil-tex
  :hook (LaTeX-mode . evil-tex-mode)
  :after (evil))

(use-package evil-tutor
  :general
  (jl/SPC-keys
    "hTv" 'evil-tutor-start))

;;; Which key
(use-package which-key
  :after (evil)
  :config
  (which-key-mode)
  :diminish which-key-mode
  :custom
  (which-key-idle-delay 0.4)
  (which-key-idle-secondary-delay 0.01)
  (which-key-sort-order 'which-key-prefix-then-key-order)
  (which-key-sort-uppercase-first nil)
  (which-key-min-display-lines 6)
  (which-key-max-description-length 32)
  (which-key-add-column-padding 1)
  (which-key-allow-multiple-replacements t))
