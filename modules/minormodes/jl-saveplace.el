(use-package saveplace
  :defer t
  :hook ((prog-mode text-mode) . save-place-mode))