;;; jl-elpher.el --- jl elpher configuration -*- lexical-binding: t -*-

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

(use-package elpher
  :commands (elpher)
  ;; :hook (elpher-mode . variable-pitch-mode)
  :custom
  (elpher-bookmarks-file "~/.spacemacs.d/elpher-bookmarks")
  (elpher-start-page-url "gemini://gemini.circumlunar.space")
  :general
  (jl/SPC-keys
    "arg" 'elpher)

  (jl/major-modes
    :keymaps 'elpher-mode-map
    "TAB"       'elpher-next-link
    "<backtab>" 'elpher-prev-link
    "u" 'elpher-back
    "U" 'elpher-back-to-start
    "O" 'elpher-root-dir
    "g" 'elpher-go
    "o" 'elpher-go-current
    "t" '(org-latex-preview :which-key "view latex")
    "r" 'elpher-redraw
    "R" 'elpher-reload
    "T" 'elpher-toggle-tls
    "." 'elpher-view-raw
    "d" 'elpher-download
    "D" 'elpher-download-current
    "m" 'elpher-jump
    "i" 'elpher-info-link
    "I" 'elpher-info-current
    "c" 'elpher-copy-link-url
    "C" 'elpher-copy-current-url
    "a" 'elpher-bookmark-link
    "A" 'elpher-bookmark-current
    "x" 'elpher-unbookmark-link
    "X" 'elpher-unbookmark-current
    "B" 'elpher-bookmarks
    "S" 'elpher-set-gopher-coding-system
    "F" 'elpher-forget-current-certificate)
  :config
  (set-face-attribute 'elpher-gemini-heading1 nil :inherit 'org-level-1)
  (set-face-attribute 'elpher-gemini-heading2 nil :inherit 'org-level-2)
  (set-face-attribute 'elpher-gemini-heading3 nil :inherit 'org-level-2))

(provide 'jl-elpher)
;;; jl-elpher.el ends here
