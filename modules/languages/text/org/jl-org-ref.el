;;; jl-org-ref.el --- jl org-ref configuration -*- lexical-binding: t -*-

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

(defun jl/org-ref-keys ()
  (evil-define-key 'normal bibtex-mode-map
    (kbd "C-j") 'org-ref-bibtex-next-entry
    (kbd "C-k") 'org-ref-bibtex-previous-entry
    "gj" 'org-ref-bibtex-next-entry
    "gk" 'org-ref-bibtex-previous-entry)

  (jl/major-modes
    :keymaps 'bibtex-mode-map
    :states 'normal
    :major-modes t
    "l" '(:ignore t :which-key "lookup"))

  (jl/major-modes
    :keymaps 'bibtex-mode-map
    :states 'normal
    :major-modes t
    ;; Navigation
    "j" 'org-ref-bibtex-next-entry
    "k" 'org-ref-bibtex-previous-entry

    ;; Open
    "b" 'org-ref-open-in-browser
    "n" 'org-ref-open-bibtex-notes
    "p" 'org-ref-open-bibtex-pdf

    ;; Misc
    "h" 'org-ref-bibtex-hydra/body
    "i" 'org-ref-bibtex-hydra/org-ref-bibtex-new-entry/body-and-exit
    "s" 'org-ref-sort-bibtex-entry

    ;; Lookup utilities
    "la" 'arxiv-add-bibtex-entry
    "lA" 'arxiv-get-pdf-add-bibtex-entry
    "ld" 'doi-utils-add-bibtex-entry-from-doi
    "li" 'isbn-to-bibtex
    "lp" 'pubmed-insert-bibtex-from-pmid))

(use-package org-ref
  :after org
  :defer t
  :general
  (jl/major-modes
    :keymaps 'latex-mode-map
    :states 'normal
    "ic" 'org-ref-insert-link)

  (jl/major-modes
    :keymaps 'org-mode-map
    :states '(normal visual motion)
    :major-modes t
    "ir" 'org-ref-insert-ref-link
    "ic" 'org-ref-insert-cite-link)
  :custom
  (bibtex-completion-bibliography "~/texmf/bibtex/bib/bibliography.bib")
  (bibtex-completion-library-path "~/Documents/PDFs/")
  (org-latex-prefer-user-labels t)
  :config
  (jl/org-ref-keys))

(provide 'jl-org-ref)
;;; jl-org-ref.el ends here
