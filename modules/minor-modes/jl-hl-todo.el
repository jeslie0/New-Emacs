;;; jl-hl-todo.el --- jl hl-todo configuration -*- lexical-binding: t -*-

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

(use-package hl-todo
  :defer t
  :hook ((prog-mode text-mode) . hl-todo-mode)
  :after org
  :config
  (add-to-list 'hl-todo-keyword-faces `("TODO" . ,(face-foreground 'org-todo)))
  ;; (add-to-list 'hl-todo-keyword-faces `("DONE" . ,(face-foreground 'org-done)))
  )

(provide 'jl-hl-todo)
;;; jl-hl-todo.el ends here
