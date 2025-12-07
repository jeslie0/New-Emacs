(use-package typst-ts-mode
  :straight (:type git :host codeberg :repo "meow_king/typst-ts-mode" :branch "develop")
  :defer t
  :hook ((typst-ts-mode . display-line-numbers-mode))
  :general
  (jl/major-modes
    :keymaps 'typst-ts-mode-map
    :states '(normal visual motion)
    :major-modes t
    "xf" '(:ignore t :which-key "fonts")
    "f" '(:ignore t :which-key "fill")
    "h" '(:ignore t :which-key "help")
    "x" '(:ignore t :which-key "text/fonts")
    "z" '(:ignore t :which-key "fold")
    "i" '(:ignore t :which-key "insert")
    "r" '(:ignore t :which-key "reftex")

    "." #'typst-ts-tmenu
    "a" #'typst-ts-compile
    "A" #'typst-ts-compile-and-preview

    "p" #'typst-preview-start)
  :custom
  (typst-ts-watch-options "--open")
  (typst-ts-mode-enable-raw-blocks-highlight t)
  )

(use-package typst-preview
  :defer t
  :general
  (jl/major-modes
    :keymaps 'typst-ts-mode-map
    :states '(normal visual motion)
    :major-modes t
    "p" #'typst-preview-start)
  )
