(if (treesit-available-p)
    (use-package json-ts-mode
      :defer t)
  (use-package json-mode
    :defer t))
