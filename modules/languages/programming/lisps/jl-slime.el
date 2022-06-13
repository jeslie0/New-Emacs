;;; jl-slime.el --- jl slime configuration -*- lexical-binding: t -*-

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

(use-package slime
  :defer t
  :init
  (setq inferior-lisp-program "sbcl")
  :general
  (jl/major-modes
    :keymaps 'lisp-mode-map
    :states '(normal visual operator)
    :major-modes t
    "h" '(:ignore t :which-key "help")
    "e" '(:ignore t :which-key "eval")
    "s" '(:ignore t :which-key "repl")
    "c" '(:ignore t :which-key "compile")
    "g" '(:ignore t :which-key "nav")
    "m" '(:ignore t :which-key "macro")
    "t" '(:ignore t :which-key "toggle")
    "'" 'slime

    "cc" 'slime-compile-file
    "cC" 'slime-compile-and-load-file
    "cl" 'slime-load-file
    "cf" 'slime-compile-defun
    "cr" 'slime-compile-region
    "cn" 'slime-remove-notes

    "eb" 'slime-eval-buffer
    "ef" 'slime-eval-defun
    "eF" 'slime-undefine-function
    "ee" 'slime-eval-last-expression
    "el" 'spacemacs/slime-eval-sexp-end-of-line
    "er" 'slime-eval-region

    "gb" 'slime-pop-find-definition-stack
    "gn" 'slime-next-note
    "gN" 'slime-previous-note

    "ha" 'slime-apropos
    "hA" 'slime-apropos-all
    "hd" 'slime-disassemble-symbol
    "hh" 'slime-describe-symbol
    "hH" 'slime-hyperspec-lookup
    "hi" 'slime-inspect-definition
    "hp" 'slime-apropos-package
    "ht" 'slime-toggle-trace-fdefinition
    "hT" 'slime-untrace-all
    "h<" 'slime-who-calls
    "h>" 'slime-calls-who
    ;; TODO: Add key bindings for who binds/sets globals?
    "hr" 'slime-who-references
    "hm" 'slime-who-macroexpands
    "hs" 'slime-who-specializes

    "ma" 'slime-macroexpand-all
    "mo" 'slime-macroexpand-1

    "se" 'slime-eval-last-expression-in-repl
    "si" 'slime
    "sq" 'slime-quit-lisp

    "tf" 'slime-toggle-fancy-trace))

(provide 'jl-slime)
;;; jl-slime.el ends here
