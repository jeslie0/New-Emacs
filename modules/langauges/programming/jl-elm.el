(use-package elm-mode
  :general
  (jl/major-modes
    :keymaps 'elm-mode-map
    :states '(normal visual operator)
    :major-modes t
    "m" '(:ignore t :which-key "make")
    "s" '(:ignore t :which-key "repl")
    "r" '(:ignore t :which-key "reactor")
    "p" '(:ignore t :which-key "package")

    "mc" 'elm-compile-buffer
    "mm" 'elm-compile-main
    "ma" 'elm-compile-add-annotations
    "mr" 'elm-compile-clean-imports

    "sl" 'elm-repl-load
    "sp" 'elm-repl-push
    "se" 'elm-repl-push-decl

    "rn" 'elm-preview-buffer
    "rm" 'elm-preview-main
    "rr" 'elm-reactor

    "pd" 'elm-documentation-lookup
    "pi" 'elm-import
    "ps" 'elm-sort-imports
    "pk" 'elm-package-catalog
    "pK" 'elm-package-refresh-contents)
  :config
  (when (executable-find "elm-format")
    (jl/major-modes
      :keymaps 'elm-mode-map
      :states '(normal visual operator)
      :major-modes t
      "f" 'elm-format-buffer))
  (when (executable-find "elm-test")
    (jl/major-modes
      :keymaps 'elm-mode-map
      :states '(normal visual operator)
      :major-modes t
      "v" 'elm-test-project)))

(use-package ob-elm
  :defer t)
