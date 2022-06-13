;;; jl-edebug.el --- jl edebug configuration -*- lexical-binding: t -*-

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

(use-package debug
  :defer t)

(use-package edebug
  :general
  (jl/major-modes
    :keymaps 'edebug-eval-mode-map
    :states '(normal visual operator)
    :major-modes t
    "g" '(:ignore t :which-key "goto")
    "e" '(:ignore t :which-key "eval")
    "gw" 'edebug-where
    "a" 'edebug-delete-eval-item
    "k" 'edebug-delete-eval-item
    "," 'edebug-update-eval-list
    "c" 'edebug-update-eval-list
    "ee" 'edebug-eval-last-sexp
    "eE" 'edebug-eval-print-last-sexp))

(provide 'jl-edebug)
;;; jl-edebug.el ends here
