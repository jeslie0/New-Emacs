(use-package envrc
  :defer .1
  :general
  (jl/SPC-keys
    "d"  '(:ignore t :which-key "direnv")
    "da" 'envrc-allow
    "dd" 'envrc-deny
    "dg" 'envrc-global-mode
    "dr" 'envrc-reload
    "dR" 'envrc-reload-all)
  :config
  (envrc-global-mode))
