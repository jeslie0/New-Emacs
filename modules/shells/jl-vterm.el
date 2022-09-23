(use-package vterm
  :general
  (jl/SPC-keys
    "asv" 'vterm)
  :straight nil
  :commands vterm
  :custom
  (term-prompt-regexp "^[^#$%>\n]*[#$%>] *")  ;; Set this to match your custom shell prompt
  (vterm-max-scrollback 10000))

(use-package eshell-vterm
  :defer t
  :after eshell
  :init
  (defalias 'eshell/v 'eshell-exec-visual)
  :config
  (eshell-vterm-mode))

(use-package multi-vterm
  :after vterm)
