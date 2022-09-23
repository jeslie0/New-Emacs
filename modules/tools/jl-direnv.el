(use-package direnv
  :defer .1
  :general
  (jl/SPC-keys
    "d"  '(:ignore t :which-key "direnv")
    "da" 'direnv-allow
    "du" 'direnv-update-environment
    "dU" 'direnv-update-directory-environment)
  :config
  (direnv-mode)
  :custom
  (direnv-always-show-summary nil))
