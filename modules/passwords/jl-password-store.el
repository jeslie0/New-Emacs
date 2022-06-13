;;; jl-password-store.el --- jl password-store configuration -*- lexical-binding: t -*-

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

(use-package password-store
  :general
  (jl/SPC-keys
    "apy" 'password-store-copy
    "apg" 'password-store-generate
    "api" 'password-store-insert
    "apc" 'password-store-edit
    "apr" 'password-store-rename
    "apd" 'password-store-remove
    "apD" 'password-store-clear
    "apI" 'password-store-init
    "apw" 'password-store-url)
  (jl/SPC-keys
    "ap" '(:ignore t :which-key "pass")))

(provide 'jl-password-store)
;;; jl-password-store.el ends here
