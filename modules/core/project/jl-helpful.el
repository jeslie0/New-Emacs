;;; jl-helpful.el --- jl helpful configuration -*- lexical-binding: t -*-

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

(use-package helpful
  ;; :after ivy
  :after vertico
  ;; :custom
  ;; (counsel-describe-function-function #'helpful-callable)
  ;; (counsel-describe-variable-function #'helpful-variable)
  :bind
  ;; ([remap describe-function] . counsel-describe-function)
  ([remap describe-function] . helpful-function)
  ([remap describe-command]  . helpful-command)
  ;; ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key]      . helpful-key)
  :init
  (defvar read-symbol-positions-list nil)) ;; bug fix

(provide 'jl-helpful)
;;; jl-helpful.el ends here
