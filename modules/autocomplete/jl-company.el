(use-package company
  :defer t
  :hook ((prog-mode text-mode) . company-mode)
  :config
  (global-company-mode 1))

(use-package company-prescient
  :after company
  :config
  (company-prescient-mode 1))

(use-package company-shell
  :defer t
  :after sh
  :config
  (add-to-list 'company-backends 'company-shell))
