;;; jl-general.el --- jl general configuration -*- lexical-binding: t -*-

;; Author: James Leslie <jamesleslie@posteo.net>
;; Created: 12/06/2022


;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:

;; commentary

;;; Code:

;;; Functions
;;;; sudo-edit
;; Copied from spacemacs.
(defun sudo-edit (&optional arg)
  (interactive "P")
  (use-package tramp
    :defer t)
  (let ((fname (if (or arg (not buffer-file-name))
                   (read-file-name "File: ")
                 buffer-file-name)))
    (find-file
     (if (not (tramp-tramp-file-p fname))
         (concat "/sudo:root@localhost:" fname)
       (with-parsed-tramp-file-name fname parsed
         (when (equal parsed-user "root")
           (error "Already root!"))
         (let* ((new-hop (tramp-make-tramp-file-name
                          ;; Try to retrieve a tramp method suitable for
                          ;; multi-hopping
                          (cond ((tramp-get-method-parameter
                                  parsed 'tramp-login-program))
                                ((tramp-get-method-parameter
                                  parsed 'tramp-copy-program))
                                (t parsed-method))
                          parsed-user
                          parsed-domain
                          parsed-host
                          parsed-port
                          nil
                          parsed-hop))
                (new-hop (substring new-hop 1 -1))
                (new-hop (concat new-hop "|"))
                (new-fname (tramp-make-tramp-file-name
                            "sudo"
                            parsed-user
                            parsed-domain
                            parsed-host
                            parsed-port
                            parsed-localname
                            new-hop)))
           new-fname))))))


;;;; Finding dotfiles
(defun find-emacs-dotfile ()
  "Edit the `dotfile', in the current window."
  (interactive)
  (find-file-existing "~/.emacs.d/ReadMe.org"))

(defun find-system-dotfile ()
  "Edit the `dotfile', in the current window."
  (interactive)
  (find-file-existing "~/.dotfiles/ReadMe.org"))

;;;; delete-this-file
(defun delete-file-and-buffer ()
  "Remove file connected to current buffer and kill buffer."
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

;;;; Renaming
;; Taken from [[https://emacsredux.com/blog/2013/05/04/rename-file-and-buffer/][emacsredux]].
(defun rename-file-and-buffer ()
  "Rename current buffer and file it is visiting."
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

;;; General
(use-package general
  :custom
  (general-override-states '(insert emacs hybrid normal visual motion operator replace))
  :config
  (general-auto-unbind-keys)


;;; Definers

  (general-create-definer jl/SPC-keys
    :states '(normal visual motion)
    :keymaps 'override
    :prefix "SPC")

  (general-create-definer jl/major-modes
    :states '(normal visual motion)
    :prefix ",")

  (general-create-definer jl/C-c-keys
    :states '(normal visual insert emacs operator motion)
    :prefix "C-c")

;;; Keybindings
  (jl/SPC-keys
    "a"  '(:ignore t :which-key "applications")
    "ae" '(:ignore t :which-key "email")
    "ar" '(:ignore t :which-key "readers")
    "as" '(:ignore t :which-key "shells")
    "at" '(:ignore t :which-key "tools")
    "b"  '(:ignore t :which-key "buffers")
    "c"  '(:ignore t :which-key "compile/Comments")
    "e"  '(:ignore t :which-key "errors")
    "f"  '(:which-key "files")
    "fe" '(:which-key "Emacs")
    "g"  '(:ignore t :which-key "git")
    "h"  '(:ignore t :which-key "help")
    "i"  '(:ignore t :which-key "insertion")
    "j"  '(:ignore t :which-key "jump/join/split")
    "k"  '(:ignore t :which-key "lisp")
    "n"  '(:ignore t :which-key "narrow/numbers")
    "p"  '(:ignore t :which-key "projects")
    "q"  '(:ignore t :which-key "quit")
    "r"  '(:ignore t :which-key "registers/rings/resume")
    "s"  '(:ignore t :which-key "search/symbol")
    "q"  '(:ignore t :which-key "quit")
    "t"  '(:ignore t :which-key "toggles")
    "w"  '(:ignore t :which-key "windows")
    "z"  '(:ignore t :which-key "zoom")
    "C"  '(:ignore t :which-key "Capture/Colours")
    "D"  '(:ignore t :which-key "Diff/compare")
    "F"  '(:ignore t :which-key "Frames")
    "K"  '(:ignore t :which-key "Keyboard Macros")
    "N"  '(:ignore t :which-key "Navigation")
    "S"  '(:ignore t :which-key "Spelling")
    "T"  '(:ignore t :which-key "UI toggles/Themes")
    "C-v" '(:ignore t :which-key "Rectangles")
    "m"   '(:ignore t :which-key "major mode")

    "!" 'eshell
    "fc" 'copy-file
    "fd" 'delete-file-and-buffer
    "fed" '(find-emacs-dotfile :which-key "Open init file")
    "fnd" '(find-system-dotfile :which-key "Open dotfiles")
    "fE" '(sudo-edit :which-key "Edit with sudo...")
    "fR" 'rename-file-and-buffer
    "fs" '(save-buffer :which-key "save")
    "qq" 'kill-emacs
    "ts" '(hydra-text-scale/body :which-key "scale text")
    "w-" 'split-window-below
    "w/" 'split-window-right
    "wd" 'delete-window)


(global-set-key (kbd "<escape>") 'keyboard-escape-quit))

(provide 'jl-general)
;;; jl-general.el ends here
