(use-package ivy-bibtex
  :after (ivy bibtex)
  :defer t
  :general
  (jl/major-modes
    :keymaps 'bibtex-mode-map
    :states 'normal
    "m" 'ivy-bibtex))

(use-package org-ref-ivy
  :commands (org-ref-insert-cite-link
	     org-ref-insert-ref-link)
  :straight org-ref
  :after (org ivy)
  :custom
  (org-ref-insert-link-function 'org-ref-insert-link-hydra/body)
  (org-ref-insert-cite-function 'org-ref-cite-insert-ivy)
  (org-ref-insert-label-function 'org-ref-insert-label-link)
  (org-ref-insert-ref-function 'org-ref-insert-ref-link)
  (org-ref-cite-onclick-function (lambda (_) (org-ref-citation-hydra/body)))
  )
