(if (treesit-available-p)
    (use-package json-ts-mode
      :defer t
      :mode ("\\.json\\'" . json-ts-mode)
      :config
      (setq json-ts-mode-indent-offset 4))
  (use-package json-mode
    :defer t))
