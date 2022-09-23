(use-package erc-image
  :hook (erc-mode . erc-image-mode)
  :defer t
  :custom
  (erc-image-inline-rescale 400)
  :after erc)
