(use-package spell-fu
  :hook ((prog-mode text-mode) . spell-fu-mode)
  :general
  (jl/SPC-keys
    "s" '(:ignore t :which-key "spelling")
    "sa" 'spell-fu-word-add
    "sb" 'spell-fu-buffer
    "sn" 'spell-fu-goto-next-error
    "sp" 'spell-fu-goto-previous-error
    "sr" 'spell-fu-word-remove
    ;; "ss" 'ispell-word
    "ss" 'flyspell-correct-at-point)
  :init
  (setq ispell-dictionary "en_GB"
        ispell-personal-dictionary "~/.aspell.en.pws"
        ispell-grep-command "rg"
        ispell-use-framepop-p nil
        spell-fu-faces-exclude '(org-block-begin-line org-block-end-line org-block org-code org-date org-drawer org-document-info-keyword org-ellipsis org-link org-meta-line org-properties org-properties-value org-special-keyword org-src org-tag org-verbatim)))
