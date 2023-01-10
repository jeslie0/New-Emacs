(use-package flymake)

(use-package flymake-cursor
  :after flymake
  :hook (flymake-mode . flymake-cursor-mode))
