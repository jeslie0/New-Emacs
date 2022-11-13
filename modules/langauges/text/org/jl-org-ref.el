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
