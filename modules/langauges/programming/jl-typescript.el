(when (treesit-available-p)
  (use-package typescript-ts-mode
    :defer t))

(use-package ob-typescript
  :defer t)
