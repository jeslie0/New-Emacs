;;; jl-vertico.el --- jl vertico configuration -*- lexical-binding: t -*-

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

(use-package vertico
  :straight (vertico :includes vertico-directory
                     :files (:defaults "extensions/vertico-directory.el"))
  :general (:keymaps 'vertico-map
                     "C-j" 'vertico-next
                     "C-k" 'vertico-previous
                     "C-g" 'vertico-exit
                     "RET" 'vertico-directory-enter
                     "DEL" 'vertico-directory-delete-char
                     "M-DEL" 'vertico-directory-delete-word)
  ;; Tidy shadowed file names
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy)
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(provide 'jl-vertico)
;;; jl-vertico.el ends here
