(use-package define-word
  :defer t
  :commands (define-word define-word-at-point)
  :general
  (jl/SPC-keys
    "sd" 'define-word-at-point))
