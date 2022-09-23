(use-package flycheck
  :defer t
  :hook ((prog-mode text-mode) . flycheck-mode)
  :config
  (global-flycheck-mode t))
