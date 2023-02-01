(use-package flymake
  :defer t
  :hook ((prog-mode text-mode) . flymake-mode)
  :general
  (jl/SPC-keys
    :keymaps 'flymake-mode-map
    :states '(normal visual operator)
    "e" '(:ignore t :which-key "errors")
    "eb" 'flymake-show-buffer-diagnostics
    "es" 'consult-flymake
    "en" 'flymake-goto-next-error
    "ep" 'flymake-goto-prev-error
    "eP" 'flymake-show-project-diagnostics
    "el" 'flymake-switch-to-log-buffer))

(use-package flymake-cursor
  :after flymake
  :hook (flymake-mode . flymake-cursor-mode)
  :general
  (jl/SPC-keys
    :keymaps 'flymake-mode-map
    :states '(normal visual operator)
    "ec" 'flymake-cursor-show-errors-at-point-now))
