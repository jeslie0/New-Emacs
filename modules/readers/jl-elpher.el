(use-package elpher
  :commands (elpher)
  ;; :hook (elpher-mode . variable-pitch-mode)
  :custom
  (elpher-bookmarks-file (concat user-emacs-directory "elpher-bookmarks"))
  (elpher-start-page-url "gemini://gemini.circumlunar.space")
  :general
  (jl/SPC-keys
    "arg" 'elpher)

  (jl/major-modes
    :keymaps 'elpher-mode-map
    "TAB"       'elpher-next-link
    "<backtab>" 'elpher-prev-link
    "u" 'elpher-back
    "U" 'elpher-back-to-start
    "O" 'elpher-root-dir
    "g" 'elpher-go
    "o" 'elpher-go-current
    "t" '(org-latex-preview :which-key "view latex")
    "r" 'elpher-redraw
    "R" 'elpher-reload
    "T" 'elpher-toggle-tls
    "." 'elpher-view-raw
    "d" 'elpher-download
    "D" 'elpher-download-current
    "m" 'elpher-jump
    "i" 'elpher-info-link
    "I" 'elpher-info-current
    "c" 'elpher-copy-link-url
    "C" 'elpher-copy-current-url
    "a" 'elpher-bookmark-link
    "A" 'elpher-bookmark-current
    "x" 'elpher-unbookmark-link
    "X" 'elpher-unbookmark-current
    "B" 'elpher-bookmarks
    "S" 'elpher-set-gopher-coding-system
    "F" 'elpher-forget-current-certificate)
  :config
  (set-face-attribute 'elpher-gemini-heading1 nil :inherit 'org-level-1)
  (set-face-attribute 'elpher-gemini-heading2 nil :inherit 'org-level-2)
  (set-face-attribute 'elpher-gemini-heading3 nil :inherit 'org-level-2))
