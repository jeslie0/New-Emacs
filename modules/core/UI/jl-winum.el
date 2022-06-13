;;; jl-winum.el --- jl winum configuration -*- lexical-binding: t -*-

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
;;; Keybindings
(defun jl/winum-keys ()
  (defhydra window-transient-state ()
    "Window Transient State"
    ;; Select
    ("j" evil-window-down)
    ("<down>" evil-window-down)
    ("k" evil-window-up)
    ("<up>" evil-window-up)
    ("h" evil-window-left)
    ("<left>" evil-window-left)
    ("l" evil-window-right)
    ("<right>" evil-window-right)
    ("0" winum-select-window-0)
    ("1" winum-select-window-1)
    ("2" winum-select-window-2)
    ("3" winum-select-window-3)
    ("4" winum-select-window-4)
    ("5" winum-select-window-5)
    ("6" winum-select-window-6)
    ("7" winum-select-window-7)
    ("8" winum-select-window-8)
    ("9" winum-select-window-9)
    ("a" ace-window)
    ("o" other-frame)
    ("w" other-window)
    ;; Move
    ("J" evil-window-move-very-bottom)
    ("<S-down>" evil-window-move-very-bottom)
    ("K" evil-window-move-very-top)
    ("<S-up>" evil-window-move-very-top)
    ("H" evil-window-move-far-left)
    ("<S-left>" evil-window-move-far-left)
    ("L" evil-window-move-far-right)
    ("<S-right>" evil-window-move-far-right)
    ("r" rotate-windows-forward)
    ("R" rotate-windows-backward)
    ;; Split
    ("s" split-window-below)
    ("S" split-window-below-and-focus)
    ("-" split-window-below-and-focus)
    ("v" split-window-right)
    ("V" split-window-right-and-focus)
    ("/" split-window-right-and-focus)
    ("m" toggle-maximize-buffer)
    ("|" maximize-vertically)
    ("_" maximize-horizontally)
    ;; Resize
    ("[" shrink-window-horizontally)
    ("]" enlarge-window-horizontally)
    ("{" shrink-window)
    ("}" enlarge-window)
    ;; Other
    ("d" delete-window)
    ("D" delete-other-windows)
    ("u" winner-undo)
    ("U" winner-redo)
    ("q" nil :exit t))

  (jl/SPC-keys
    "0" '(winum-select-window-0 :which-key "Select window 0")
    "1" '(winum-select-window-1 :which-key "Select window 1")
    "2" '(winum-select-window-2 :which-key "Select window 2")
    "3" '(winum-select-window-3 :which-key "Select window 3")
    "4" '(winum-select-window-4 :which-key "Select window 4")
    "5" '(winum-select-window-5 :which-key "Select window 5")
    "6" '(winum-select-window-6 :which-key "Select window 6")
    "7" '(winum-select-window-7 :which-key "Select window 7")
    "8" '(winum-select-window-8 :which-key "Select window 8")
    "9" '(winum-select-window-9 :which-key "Select window 9")
    "w." 'window-transient-state/body))

;;; winum
(use-package winum
  :after doom-modeline
  :config (winum-mode)
  :diminish winum-mode
  :config
  (jl/winum-keys))

(provide 'jl-winum)
;;; jl-winum.el ends here
