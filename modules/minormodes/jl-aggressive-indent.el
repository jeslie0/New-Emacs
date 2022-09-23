(use-package aggressive-indent
  :defer t
  ;; :init
  ;; (global-aggressive-indent-mode 1)
  :config
  (add-to-list 'aggressive-indent-excluded-modes 'cc-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'c-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'haskell-cabal-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'haskell-mode))
