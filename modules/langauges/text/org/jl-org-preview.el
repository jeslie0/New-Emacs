(use-package org-preview
  :straight (:host github :repo "karthink/org-preview" :branch "master" :files ("org-preview.el"))
  :hook (org-preview-mode . org-mode))
