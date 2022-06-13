;;; jl-perspective.el --- jl perspective config -*- lexical-binding: t -*-

;; Author: James Leslie <jamesleslie@posteo.net>
;; Created: 13-06-2022


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
(defun jl/kill-this-buffer (&optional arg)
  "Kill the current buffer.
If the universal prefix argument is used then kill also the window."
  (interactive "P")
  (if (window-minibuffer-p)
      (abort-recursive-edit)
    (if (equal '(4) arg)
        (kill-buffer-and-window)
      (kill-buffer))))

(defun toggle-centered-buffer ()
  "Toggle visual centering of the current buffer."
  (interactive)
  (cl-letf ((writeroom-maximize-window nil)
         (writeroom-mode-line t))
    (call-interactively 'writeroom-mode)))

(defun toggle-distraction-free ()
  "Toggle visual distraction free mode."
  (interactive)
  (cl-letf ((writeroom-maximize-window t)
         (writeroom-mode-line nil))
    (call-interactively 'writeroom-mode)))

;;; Perspective


(use-package perspective
  :defer .1
  :general
  ("C-x k" 'persp-kill-buffer*)
  (jl/SPC-keys
    "b'" 'persp-switch-by-number
    "ba" 'persp-add-buffer
    "bA" 'persp-set-buffer
    "bD" 'persp-remove-buffer
    "bd" '(jl/kill-this-buffer :which-key: "kill-this-buffer")
    "bi" 'persp-import
    "bk" '(persp-kill :which-key "kill perspective")
    "bn" 'next-buffer
    "bN" 'persp-next
    "bp" 'previous-buffer
    "bP" 'persp-prev
    "bs" '(persp-switch :which-key "switch perspective")
    "bS" 'persp-state-save
    "bL" 'persp-state-load

    "bR" 'revert-buffer)
  :config
  (setq persp-suppress-no-prefix-key-warning t)
  (persp-mode))


(provide 'jl-perspective)
;;; jl-perspective.el ends here
