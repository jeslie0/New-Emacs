(use-package pandoc-mode
  :commands (pandoc-main-hydra/body)
  :defer t
  :general
  (jl/SPC-keys
    "P" '(pandoc-main-hydra/body :which-key "Pandoc")))
