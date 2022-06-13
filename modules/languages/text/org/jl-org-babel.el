;;; jl-org-babel.el --- jl org-babel configuration -*- lexical-binding: t -*-

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

(use-package ob-shell
  :straight org
  :commands
  (org-babel-execute:sh
   org-babel-expand-body:sh

   org-babel-execute:bash
   org-babel-expand-body:bash)
  :config
  (add-to-list 'org-babel-load-languages '(shell . t)))

(use-package ob-python
  :straight org
  :commands
  (org-babel-execute:python
   org-babel-expand-body:python))


(use-package ob-emacs-lisp
  :straight org
  :commands
  (org-babel-execute:emacs-lisp
   org-babel-expand-body:emacs-lisp
   org-babel-execute:elisp
   org-babel-expand-body:elisp))

(use-package ob-js
  :straight org
  :commands
  (org-babel-execute:js
   org-babel-expand-body:js))

(use-package ob-latex
  :straight org
  :commands
  (org-babel-execute:latex
   org-babel-expand-body:latex))

(use-package ob-haskell
  :straight org
  :commands
  (org-babel-execute:haskell
   org-babel-expand-body:haskell))

(use-package ob-C
  :straight org
  :commands
  (org-babel-execute:C
   org-babel-expand-body:C
   org-babel-execute:C++
   org-babel-expand-body:C++))

(provide 'jl-org-babel)
;;; jl-org-babel.el ends here
