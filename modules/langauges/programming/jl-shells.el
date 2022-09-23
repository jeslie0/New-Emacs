(use-package sh-script
  ;; :mode ("\\.sh\\'"
  ;;        "\\.zsh\\'"
  ;;        "zlogin\\'"
  ;;        "zlogout\\'"
  ;;        "zpreztorc\\'"
  ;;        "zprofile\\'"
  ;;        "zshenv\\'"
  ;;        "zshrc\\'")
  :general
  (jl/major-modes
    :keymaps 'sh-mode-map
    :states '(normal visual operator)
    :major-modes t
    "i" '(:ignore t :which-key "insert")
    "g" '(:ignore t :which-key "goto")

    "\\" 'sh-backslash-region
    "ic" 'sh-case
    "ii" 'sh-if
    "if" 'sh-function
    "io" 'sh-for
    "ie" 'sh-indexed-loop
    "iw" 'sh-while
    "ir" 'sh-repeat
    "is" 'sh-select
    "iu" 'sh-until
    "ig" 'sh-while-getopts)
  )

(use-package shfmt
  :hook (sh-mode . shfmt-on-save-mode)
  :general
  (jl/major-modes
    :keymaps 'sh-mode-map
    :states '(normal visual operator)
    :major-modes t
    "=" 'shfmt-buffer))
