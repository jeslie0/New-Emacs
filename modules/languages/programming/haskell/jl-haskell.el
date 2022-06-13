;;; jl-haskell.el --- jl haskell configuration -*- lexical-binding: t -*-

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
(defun jl/haskell-keys ()
  (jl/major-modes
    :keymaps 'haskell-mode-map
    :states '(normal visual operator)
    :major-modes t
    "g" '(:ignore t :which-key "navigation")
    "s" '(:ignore t :which-key "repl")
    "c" '(:ignore t :which-key "cabal")
    "h" '(:ignore t :which-key "documentation")
    "d" '(:ignore t :which-key "debug")
    "r" '(:ignore t :which-key "refactor"))

  (jl/major-modes
    :keymaps 'haskell-mode-map
    :states '(normal visual operator)
    :major-modes t
    "'" 'haskell-interactive-switch
    "S" 'haskell-mode-stylish-buffer

    "sb"  'haskell-process-load-file
    "sc"  'haskell-interactive-mode-clear
    "sS"  'spacemacs/haskell-interactive-bring
    "ss"  'haskell-interactive-switch
    "st"  'haskell-session-change-target
    "'"   'haskell-interactive-switch

    "ca"  'haskell-process-cabal
    "cb"  'haskell-process-cabal-build
    "cc"  'haskell-compile
    "cv"  'haskell-cabal-visit-file

    "hd"  'inferior-haskell-find-haddock
    "hg"  'hoogle
    "hG"  'haskell-hoogle-lookup-from-local
    "hi"  'haskell-process-do-info
    "ht"  'haskell-process-do-type
    "hT"  'haskell-process-do-type-on-prev-line

    "da"  'haskell-debug/abandon
    "db"  'haskell-debug/break-on-function
    "dB"  'haskell-debug/delete
    "dc"  'haskell-debug/continue
    "dd"  'haskell-debug
    "dn"  'haskell-debug/next
    "dN"  'haskell-debug/previous
    "dp"  'haskell-debug/previous
    "dr"  'haskell-debug/refresh
    "ds"  'haskell-debug/step
    "dt"  'haskell-debug/trace

    "ri"  'haskell-format-imports)

  (general-define-key
   :states '(normal insert visual)
   :keymaps 'haskell-interactive-mode-map
   "C-j" 'haskell-interactive-mode-history-next
   "C-k" 'haskell-interactive-mode-history-previous
   "C-l" 'haskell-interactive-mode-clear)

  (jl/major-modes
    :states '(normal visual)
    :keymaps 'haskell-cabal-mode-map
    :major-modes t
    "d"   'haskell-cabal-add-dependency
    "b"   'haskell-cabal-goto-benchmark-section
    "e"   'haskell-cabal-goto-executable-section
    "t"   'haskell-cabal-goto-test-suite-section
    "m"   'haskell-cabal-goto-exposed-modules
    "l"   'haskell-cabal-goto-library-section
    "n"   'haskell-cabal-next-subsection
    "p"   'haskell-cabal-previous-subsection
    "N"   'haskell-cabal-next-section
    "P"   'haskell-cabal-previous-section
    "f"   'haskell-cabal-find-or-create-source-file))

(use-package haskell-mode
  :hook ((haskell-mode . auto-fill-mode))
  :general
  ;; (:keymaps 'haskell-mode-map
  ;;           :states 'normal
  ;;           "o" 'haskell-indentation-newline-and-indent)
  :init
  ;; ;; To get evil's "o" and "O" keys to work with indentation as expected, we use these two functions from [[https://github.com/haskell/haskell-mode/issues/1265#issuecomment-252492026][hatashiro]].
  ;; (defun haskell-evil-open-above ()
  ;;   (interactive)
  ;;   (evil-digit-argument-or-evil-beginning-of-line)
  ;;   (haskell-indentation-newline-and-indent)
  ;;   (evil-previous-line)
  ;;   (haskell-indentation-indent-line)
  ;;   (evil-append-line nil))

  ;; (defun haskell-evil-open-below ()
  ;;   (interactive)
  ;;   (evil-append-line nil)
  ;;   (haskell-indentation-newline-and-indent))

  ;; (defun haskell-format-imports ()
  ;;   "Sort and align import statements from anywhere in the source file."
  ;;   (interactive)
  ;;   (save-excursion
  ;;     (haskell-navigate-imports)
  ;;     (haskell-mode-format-imports)))

  ;; (defun haskell-process-do-type-on-prev-line ()
  ;;   (interactive)
  ;;   (haskell-process-do-type 1))
  (remove-hook 'haskell-mode-hook 'electric-indent-mode)
  :config
  (jl/haskell-keys)
  :custom
  (haskell-process-type 'auto))


(provide 'jl-haskell)
;;; jl-haskell.el ends here
