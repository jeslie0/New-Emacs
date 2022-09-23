(use-package js-mode
  :straight js
  :hook (((js-mode) . tree-sitter-mode)
         ((js-mode) . tree-sitter-hl-mode)))
