(use-package plz
  :defer t
 :straight (:host github :repo "alphapapa/plz.el" :branch "master" :files ("*.el")))

(use-package ement
  :defer t
  :straight (:host github :repo "alphapapa/ement.el" :branch "master" :files ("*.el"))
  :commands (ement-connect)
  :general
  (jl/SPC-keys
    :modes '(normal visual operator)
    "arm" 'ement-connect))
