(use-package css-mode
  :defer t
  :init
  (add-to-list 'auto-mode-alist `("\\.css\\'" . ,(if (treesit-available-p) 'css-ts-mode 'css-mode))))
