;;; jl-elm.el --- jl elm configuration -*- lexical-binding: t -*-

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

(use-package elm-mode
  :general
  (jl/major-modes
    :keymaps 'elm-mode-map
    :states '(normal visual operator)
    :major-modes t
    "m" '(:ignore t :which-key "make")
    "s" '(:ignore t :which-key "repl")
    "r" '(:ignore t :which-key "reactor")
    "p" '(:ignore t :which-key "package")

    "mc" 'elm-compile-buffer
    "mm" 'elm-compile-main
    "ma" 'elm-compile-add-annotations
    "mr" 'elm-compile-clean-imports

    "sl" 'elm-repl-load
    "sp" 'elm-repl-push
    "se" 'elm-repl-push-decl

    "rn" 'elm-preview-buffer
    "rm" 'elm-preview-main

    "pd" 'elm-documentation-lookup
    "pi" 'elm-import
    "ps" 'elm-sort-imports
    "pk" 'elm-package-catalog
    "pK" 'elm-package-refresh-contents)
  :config
  (when (executable-find "elm-format")
    (jl/major-modes
      :keymaps 'elm-mode-map
      :states '(normal visual operator)
      :major-modes t
      "f" 'elm-format-buffer))
  (when (executable-find "elm-test")
    (jl/major-modes
      :keymaps 'elm-mode-map
      :states '(normal visual operator)
      :major-modes t
      "v" 'elm-test-project)))

(provide 'jl-elm)
;;; jl-elm.el ends here
