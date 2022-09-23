(use-package artist
  :defer t
  :general
  (jl/major-modes
    :prefix-map 'artist-mode-map
    :keymaps 'picture-mode-map
    :states '(normal visual operator)
    :major-modes t))
