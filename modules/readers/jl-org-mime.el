;;; jl-org-mime.el --- jl org-mime configuration -*- lexical-binding: t -*-

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

(use-package org-mime
  :defer t
  :commands (org-mime-edit-mail-in-org-mode
             org-mime-htmlize
             org-mime-org-buffer-htmlize
             org-mime-subtree-htmlize)
  :init
  (jl/major-modes
    :keymaps 'mu4e-compose-mode-map
    :states '(normal operator visual)
    :major-modes t
    "h" '(:ignore t :which-key "html")
    "ho" 'org-mime-edit-mail-in-org-mode
    "hh" 'org-mime-htmlize))

(provide 'jl-org-mime)
;;; jl-org-mime.el ends here
