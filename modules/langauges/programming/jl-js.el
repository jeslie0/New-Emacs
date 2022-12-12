(if (treesit-available-p)
    (use-package js-ts-mode
      :straight js
      :mode ("\\.js\\'" . js-ts-mode))
  (use-package js-mode
    :straight js
    :hook (((js-mode) . tree-sitter-mode)
           ((js-mode) . tree-sitter-hl-mode))))
