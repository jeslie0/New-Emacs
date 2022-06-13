;;; jl-consult.el --- jl consult configuration -*- lexical-binding: t -*-

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

(use-package consult
  :general
  ("C-s" 'consult-line)
  (jl/SPC-keys
    "SPC" '(execute-extended-command :which-key "M-x")
    "C-e" 'consult-flymake
    "C-s" 'consult-imenu
    "C-<return>" 'consult-minor-mode-menu
    "ff" '(find-file :which-key "find file")
    "tt" '(consult-theme :which-key "choose theme")
    "bb" 'persp-switch-to-buffer*
    "/"  'consult-ripgrep)
  (jl/major-modes
    :keymaps 'org-mode-map
    :states '(normal visual operator)
    :major-modes t
    "C-s" 'consult-org-heading))

(provide 'jl-consult)
;;; jl-consult.el ends here
