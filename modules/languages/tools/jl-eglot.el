;;; jl-eglot.el --- jl eglot configuration -*- lexical-binding: t -*-

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

(use-package eglot
  :commands (eglot)
  :general
  (jl/major-modes
    :keymaps 'eglot-mode-map
    :states '(normal visual operator)
    "="   '(:ignore t :which-key "eglot")
    "=S"  '(:ignore t :which-key "server")
    "=B"  '(:ignore t :which-key "buffers")

    "=Se" 'eglot
    "=Sr" 'eglot-reconnect
    "=Ss" 'eglot-shutdown
    "=SS" 'eglot-shutdown-all
    "=Sc" 'eglot-signal-didChangeConfiguration

    "=r"  'eglot-rename
    "=f"  'eglot-format
    "=a"  'eglot-code-actions
    "=D"  'eldoc
    "=g"  'xref-find-definitions

    "=Be" 'eglot-events-buffer
    "=Bs" 'eglot-stderr-buffer)
  :custom
  (eglot-confirm-server-initiated-edits nil)
  :config
  (general-define-key
   :keymaps 'eglot-mode-map
   :states '(normal operator)
   "K" 'eldoc-box-eglot-help-at-point)
  (add-to-list 'eglot-server-programs '((tex-mode context-mode texinfo-mode bibtex-mode) "texlab"))
  (add-to-list 'eglot-server-programs '(python-mode . ("python-language-server" ""))))

(provide 'jl-eglot)
;;; jl-eglot.el ends here
