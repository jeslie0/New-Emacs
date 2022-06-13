;;; jl-gendoxy.el --- jl gendoxy configuration -*- lexical-binding: t -*-

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

(use-package gendoxy
  :straight (:host github :repo "mp81ss/gendoxy" :branch "master" :files ("*.el"))
  :general
 (jl/major-modes
   :keymaps '(c-mode-map c++-mode-map)
   :states '(normal visual operator)
   :major-modes t
   "d" '(:ignore t :which-key "doxygen")
   "dh" 'gendoxy-header
   "dt" 'gendoxy-tag
   "dT" 'gendoxy-tag-header
   "dg" 'gendoxy-group
   "dG" 'gendoxy-group-header
   "ds" 'gendoxy-group-start
   "de" 'gendoxy-group-end)
  :defer t)

(provide 'jl-gendoxy)
;;; jl-gendoxy.el ends here
