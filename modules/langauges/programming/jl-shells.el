(use-package sh-script
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
  :init
  (add-to-list 'auto-mode-alist `("\\.sh\\'" . ,(if (treesit-available-p) 'bash-ts-mode 'sh-script-mode))))

(when (executable-find "shfmt")
  (use-package shfmt
    :hook (sh-mode . shfmt-on-save-mode)
    :general
    (jl/major-modes
      :keymaps 'sh-mode-map
      :states '(normal visual operator)
      :major-modes t
      "=" 'shfmt-buffer)))
