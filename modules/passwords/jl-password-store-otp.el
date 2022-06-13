;;; jl-password-store-otp.el --- jl password-store-otp configuration -*- lexical-binding: t -*-

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

(use-package password-store-otp
  :defer t
  :general
  (jl/SPC-keys
    "apoy" 'password-store-otp-token-copy
    "apoY" 'password-store-otp-uri-copy
    "apoi" 'password-store-otp-insert
    "apoa" 'password-store-otp-append
    "apoA" 'password-store-otp-append-from-image)
  (jl/SPC-keys
    "apo" '(:ignore t :which-key "otp")))

(provide 'jl-password-store-otp)
;;; jl-password-store-otp.el ends here
