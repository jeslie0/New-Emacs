;;; jl-coq.el --- jl coq configuration -*- lexical-binding: t -*-

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

(use-package proof-general
  :general
  (jl/major-modes
    :keymaps 'coq-mode-map
    :states '(normal visual motion)
    :major-modes t
    ;; Basic proof management
    "]" 'proof-assert-next-command-interactive
    "[" 'proof-undo-last-successful-command
    "." 'proof-goto-point
    ;; Layout
    "l" '(:ignore t :which-key "Layout")
    "lc" 'pg-response-clear-displays
    "ll" 'proof-layout-windows
    "lp" 'proof-prf
    ;; Prover Interaction
    "p" '(:ignore t :which-key "Prover Interaction")
    "pi" 'proof-interrupt-process
    "pp" 'proof-process-buffer
    "pq" 'proof-shell-exit
    "pr" 'proof-retract-buffer
    ;; Prover queries ('ask prover')
    "a"  '(:ignore t :which-key "Ask Prover")
    "aa" 'coq-Print
    "aA" 'coq-Print-with-all
    "ab" 'coq-About
    "aB" 'coq-About-with-all
    "ac" 'coq-Check
    "aC" 'coq-Check-show-all
    "af" 'proof-find-theorems
    "aib" 'coq-About-with-implicits
    "aic" 'coq-Check-show-implicits
    "aii" 'coq-Print-with-implicits
    ;; Moving the point (goto)
    "g"  '(:ignore t :which-key "Goto")
    "ge" 'proof-goto-command-end
    "gl" 'proof-goto-end-of-locked
    "gs" 'proof-goto-command-start
    ;; Insertions
    "i"  '(:ignore t :which-key "Insert")
    "ic" 'coq-insert-command
    "ie" 'coq-end-Section
    "ii" 'coq-insert-intros
    "ir" 'coq-insert-requires
    "is" 'coq-insert-section-or-module
    "it" 'coq-insert-tactic
    "iT" 'coq-insert-tactical
    ;; Options
    "T"  '(:ignore t :which-key "Toggle")
    "Te" 'proof-electric-terminator-toggle
    "il" 'company-coq-lemma-from-goal
    "im" 'company-coq-insert-match-construct
    "ao" 'company-coq-occur

    "h"  '(:ignore t :which-key "Help")
    "he" 'company-coq-document-error
    "hE" 'company-coq-browse-error-messages
    "hh" 'company-coq-doc)
  :custom
  (proof-splash-enable nil)
  (proof-three-window-mode-policy 'hybrid))

(provide 'jl-coq)
;;; jl-coq.el ends here
