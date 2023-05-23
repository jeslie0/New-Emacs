(when (treesit-available-p)
  (use-package typescript-ts-mode
    :defer t
    :mode (("\\.ts\\'" . typescript-ts-mode)
           ("\\.tsx\\'" . tsx-ts-mode))))

(use-package ob-typescript
  :defer t)

(use-package tsx-ts-helper-mode
  :straight (tsx-ts-helper-mode
             :type git
             :host codeberg
             :repo "ckruse/tsx-ts-helper-mode")
  :commands (tsx-ts-helper-mode)
  :hook (tsx-ts-mode . tsx-ts-helper-mode))
