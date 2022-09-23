(use-package treemacs-perspective ;;treemacs-perspective if you use perspective.el vs. persp-mode
  :defer t
  :after (treemacs perspective) ;;or perspective vs. persp-mode
  :config (treemacs-set-scope-type 'Perspectives))
