(use-package ox-altacv
  :after org
  :straight (:host github :repo "Titan-C/org-cv" :branch "master" :files ("ox-altacv.el" "org-cv-utils.el"))
  :config
  (defun make-cv ()
    "Makes a CV from the org file"
    (interactive)
    (org-export-to-file 'altacv "mycv.tex")
    (org-latex-compile "mycv.tex"))

  (jl/major-modes
    :keymaps 'org-mode-map
    :states '(normal visual operator)
    :major-modes t
    "ec" 'make-cv))
