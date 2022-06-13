;;; jl-evil-tex.el --- jl evil-tex configuration -*- lexical-binding: t -*-

;; Author: James Leslie <jamesleslie@posteo.net>
;; Created: 12/06/2022


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

(use-package evil-tex
  :hook (LaTeX-mode . evil-tex-mode)
  :after (evil))

(provide 'jl-evil-tex)
;;; jl-evil-tex.el ends here
