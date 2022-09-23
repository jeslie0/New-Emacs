(use-package yaml-mode
  :hook (yaml-mode . (lambda () (variable-pitch-mode 0)))
  :defer t)
