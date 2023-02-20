(use-package ement
  :defer t
  :commands (ement-connect)
  :general
  (jl/SPC-keys
    :modes '(normal visual operator)
    "arm" 'ement-connect))
