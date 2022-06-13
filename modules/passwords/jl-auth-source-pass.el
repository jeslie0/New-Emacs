;;; jl-auth-source-pass.el --- jl auth-source-pass configuration -*- lexical-binding: t -*-

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

(use-package auth-source-pass
  :config
  (setq epa-pinentry-mode 'loopback)
  (setq auth-sources '(password-store))
  (setq epa-file-encrypt-to '("86AC9FE03B59F914725208DECF6607D8EB302630")
        epa-file-select-keys 1)
  (auth-source-pass-enable))

(provide 'jl-auth-source-pass)
;;; jl-auth-source-pass.el ends here
