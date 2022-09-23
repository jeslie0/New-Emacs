(use-package term
  :commands (term)
  :general
  (jl/SPC-keys
    "ast" 'term)
  :custom
  (explicit-shell-file-name "fish") ;; Change this to zsh, etc
  ;;(setq explicit-zsh-args '())         ;; Use 'explicit-<shell>-args for shell-specific args

  ;; Match the default Bash shell prompt.  Update this if you have a custom prompt
  (term-prompt-regexp "^[^#$%>\n]*[#$%>] *"))

(use-package eterm-256color
  :defer t
  :after term
  :hook (term-mode . eterm-256color-mode))
