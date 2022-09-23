(use-package hl-todo
  :defer t
  :hook ((prog-mode text-mode) . hl-todo-mode)
  :after org
  :config
  (add-to-list 'hl-todo-keyword-faces `("TODO" . ,(face-foreground 'org-todo)))
  ;; (add-to-list 'hl-todo-keyword-faces `("DONE" . ,(face-foreground 'org-done)))
  )
