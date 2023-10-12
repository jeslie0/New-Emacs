(use-package ement
  :defer t
  :commands (ement-connect)
  :general
  (jl/SPC-keys
    :modes '(normal visual operator)
    "arm" 'ement-connect)
  :custom
  (ement-room-prism 'both)
  (ement-save-sessions t) ;; Beware, this stores your token to disk in
  ;; plain text!
  )
