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
    "pf" 'consult-project-extra-find)
  :init
  (setq project-switch-commands (remove '(project-find-file "Find file") project-switch-commands))
  (add-to-list 'project-switch-commands '(consult-project-extra-find "Find file")))
