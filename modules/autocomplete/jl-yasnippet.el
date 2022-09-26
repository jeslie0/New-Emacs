(use-package yasnippet
  :hook ((prog-mode text-mode) . yas-minor-mode)
  :defer t
  :config
  (yas-global-mode 1))

(use-package consult-yasnippet
  :commands consult-yasnippet
  :general
  (jl/SPC-keys
    "is" 'consult-yasnippet))

(use-package yasnippet-snippets
  :defer t
  :after yasnippet)

;; (use-package ivy-yasnippet
;;   :defer t
;;   :after yasnippet)

(use-package haskell-snippets
  :defer t
  :after yasnippet)

(use-package yatemplate
  :defer t
  :after yasnippet)
