(use-package project
  :general
  (jl/SPC-keys
    "p" '(:ignore t :which-key "project.el"))
  (jl/SPC-keys
    :prefix "SPC p"
    :prefix-map 'project-prefix-map))

(use-package consult-project-extra
  :after (consult)
  :general
  (jl/SPC-keys
    "pf" 'consult-project-extra-find))
