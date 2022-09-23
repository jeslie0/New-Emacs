(use-package markdown-mode
  :mode
  (("\\.mkd\\'" . markdown-mode)
   ("\\.mdk\\'" . markdown-mode)
   ("\\.mdx\\'" . markdown-mode))
  :general
  (jl/major-modes
    :keymaps 'markdown-mode-map
    :states '(normal visual operator)
    :major-modes t

    "c" '(:ignore t :which-key "command")
    "h" '(:ignore t :which-key "header")
    "i" '(:ignore t :which-key "insert")
    "l" '(:ignore t :which-key "lists")
    "t" '(:ignore t :which-key "table")
    "T" '(:ignore t :which-key "toggle")
    "x" '(:ignore t :which-key "text")

    ;; rebind this so terminal users can use it
    "M-RET" 'markdown-insert-list-item
    ;; Movement
    "{"   'markdown-backward-paragraph
    "}"   'markdown-forward-paragraph
    ;; Completion, and Cycling
    "]"   'markdown-complete
    ;; Indentation
    ">"   'markdown-indent-region
    "<"   'markdown-outdent-region
    ;; Buffer-wide commands
    "c]"  'markdown-complete-buffer
    "cc"  'markdown-check-refs
    "ce"  'markdown-export
    "cm"  'markdown-other-window
    "cn"  'markdown-cleanup-list-numbers
    "co"  'markdown-open
    "cp"  'markdown-preview
    "cv"  'markdown-export-and-preview
    "cw"  'markdown-kill-ring-save
    ;; headings
    "hi"  'markdown-insert-header-dwim
    "hI"  'markdown-insert-header-setext-dwim
    "h1"  'markdown-insert-header-atx-1
    "h2"  'markdown-insert-header-atx-2
    "h3"  'markdown-insert-header-atx-3
    "h4"  'markdown-insert-header-atx-4
    "h5"  'markdown-insert-header-atx-5
    "h6"  'markdown-insert-header-atx-6
    "h!"  'markdown-insert-header-setext-1
    "h@"  'markdown-insert-header-setext-2
    ;; Insertion of common elements
    "-"   'markdown-insert-hr
    "if"  'markdown-insert-footnote
    "ii"  'markdown-insert-image
    "ik"  'spacemacs/insert-keybinding-markdown
    "il"  'markdown-insert-link
    "iw"  'markdown-insert-wiki-link
    "iu"  'markdown-insert-uri
    "iT"  'markdown-insert-table
    ;; Element removal
    "k"   'markdown-kill-thing-at-point
    ;; List editing
    "li"  'markdown-insert-list-item
    ;; Toggles
    "Ti"  'markdown-toggle-inline-images
    "Tl"  'markdown-toggle-url-hiding
    "Tm"  'markdown-toggle-markup-hiding
    "Tt"  'markdown-toggle-gfm-checkbox
    "Tw"  'markdown-toggle-wiki-links
    ;; Table
    "ta"  'markdown-table-align
    "tp"  'markdown-table-move-row-up
    "tn"  'markdown-table-move-row-down
    "tf"  'markdown-table-move-column-right
    "tb"  'markdown-table-move-column-left
    "tr"  'markdown-table-insert-row
    "tR"  'markdown-table-delete-row
    "tc"  'markdown-table-insert-column
    "tC"  'markdown-table-delete-column
    "ts"  'markdown-table-sort-lines
    "td"  'markdown-table-convert-region
    "tt"  'markdown-table-transpose
    ;; region manipulation
    "xb"  'markdown-insert-bold
    "xB"  'markdown-insert-gfm-checkbox
    "xc"  'markdown-insert-code
    "xC"  'markdown-insert-gfm-code-block
    "xi"  'markdown-insert-italic
    "xk"  'markdown-insert-kbd
    "xp"  'markdown-insert-pre
    "xq"  'markdown-insert-blockquote
    "xs"  'markdown-insert-strike-through
    "xQ"  'markdown-blockquote-region
    "xP"  'markdown-pre-region
    ;; Following and Jumping
    "N"   'markdown-next-link
    "f"   'markdown-follow-thing-at-point
    "P"   'markdown-previous-link
    "<RET>" 'markdown-do)

  :config
  ;; Make markdown-mode behave a bit more like org w.r.t. code blocks i.e.
  ;; use proper syntax highlighting
  (setq markdown-fontify-code-blocks-natively t
        markdown-display-remote-images t
        markdown-enable-highlighting-syntax t
        markdown-xhtml-header-content "" ;; TODO Add in suitable
        ;; header for mathjax and code highlighting
        )

  (add-to-list 'markdown-css-paths "https://cdn.simplecss.org/simple.min.css"))

(use-package markdown-toc
  :general
  (jl/major-modes
    :keymaps 'markdown-mode-map
    :states '(normal visual operator)
    :major-modes t
    "it" 'markdown-toc-generate-toc))
