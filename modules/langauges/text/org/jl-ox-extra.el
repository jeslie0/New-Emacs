;;; OX Extra
(use-package ox-extra
  :after org
  :straight org-contrib
  :config
  (ox-extras-activate '(latex-header-blocks ignore-headlines)))
