;;; jl-spell-fu.el --- jl spell-fu configuration -*- lexical-binding: t -*-

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


(use-package spell-fu
  :hook ((prog-mode text-mode) . spell-fu-mode)
  :general
  (jl/SPC-keys
    "s" '(:ignore t :which-key "spelling")
    "sa" 'spell-fu-word-add
    "sb" 'spell-fu-buffer
    "sn" 'spell-fu-goto-next-error
    "sp" 'spell-fu-goto-previous-error
    "sr" 'spell-fu-word-remove
    ;; "ss" 'ispell-word
    "ss" 'flyspell-correct-at-point)
  :init
  (setq ispell-dictionary "en_GB"
        ispell-personal-dictionary "~/.aspell.en.pws"
        ispell-grep-command "rg"
        ispell-use-framepop-p nil
        spell-fu-faces-exclude '(org-block-begin-line org-block-end-line org-block org-code org-date org-drawer org-document-info-keyword org-ellipsis org-link org-meta-line org-properties org-properties-value org-special-keyword org-src org-tag org-verbatim)))

(provide 'jl-spell-fu)
;;; jl-spell-fu.el ends here
