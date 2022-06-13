;;; jl-eww.el --- jl eww configuration -*- lexical-binding: t -*-

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

(use-package eww
  :defer t
  :commands (eww)
  ;; :hook (eww-mode . variable-pitch-mode)
  :general
  (jl/major-modes
    :keymaps 'eww-mode-map
    :major-modes t
    "s" 'helm-google-suggest
    "S" 'browse-web
    "t" '(org-latex-preview :which-key "view latex")
    "r" 'eww-reload
    "p" 'eww-previous-url
    "n" 'eww-next-url
    "h" 'eww-list-histories
    "d" 'eww-download
    "a" 'eww-add-bookmark
    "lb" 'eww-list-buffers
    "lo" 'eww-list-bookmarks
    "vx" 'eww-browse-with-external-browser
    "vf" 'eww-toggle-fonts
    "vr" 'eww-readable
    "vs" 'eww-view-source)
  (jl/major-modes
    :keymaps 'eww-mode-map
    :major-modes t
    "v" '(:ignore t :which-key "view")
    "l" '(:ignore t :which-key "list"))
  (jl/SPC-keys
    "ate" 'eww)
  (:states 'normal :keymaps 'eww-mode-map
           (kbd "SPC") nil))

(provide 'jl-eww)
;;; jl-eww.el ends here
