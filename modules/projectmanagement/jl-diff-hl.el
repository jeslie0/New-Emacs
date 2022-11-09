(use-package diff-hl
  :general
  (jl/SPC-keys
    "gg"  '(:ignore t :which-key "gutter")
    "ggn" 'diff-hl-next-hunk
    "ggm" 'diff-hl-mark-hunk
    "ggP" 'diff-hl-show-hunk
    "ggp" 'diff-hl-previous-hunk
    "ggr" 'diff-hl-revert-hunk
    "ggs" 'diff-hl-stage-current-hunk)
  :hook
  ((prog-mode text-mode) . diff-hl-mode)
  ((prog-mode text-mode) . diff-hl-flydiff-mode)
  ((prog-mode text-mode) . diff-hl-show-hunk-mouse-mode)
  (dired-mode . diff-hl-dired-mode-unless-remote)
  (magit-pre-refresh . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh)

  :custom
  (diff-hl-fringe-face-function '(lambda (type _pos)
                                   (intern (format "diff-hl-%s" type))))
  (diff-hl-fringe-bmp-function '(lambda (type _pos)
                                  (intern (format "diff-hl-%s" type))))
  (diff-hl-margin-symbols-alist
   '((insert . "┃")
     (delete . "┃")
     (change . "┃")
     (unknown . "?")
     (ignored . "i")))
  :config
  (define-fringe-bitmap 'diff-hl-insert
    [#b00000011] nil nil '(center repeated))
  (define-fringe-bitmap 'diff-hl-change
    [#b00000011] nil nil '(center repeated))
  (define-fringe-bitmap 'diff-hl-delete
    [#b00000011] nil nil '(center repeated))

  ;; Only needed when using a DOOM theme
  (doom-themes-set-faces nil
    '(diff-hl-insert :foreground vc-added :background bg)
    '(diff-hl-delete :foreground vc-deleted :background bg)
    '(diff-hl-change :foreground vc-modified :background bg)
    '(diff-hl-margin-insert :foreground vc-added :background bg)
    '(diff-hl-margin-delete :foreground vc-deleted :background bg)
    '(diff-hl-margin-change :foreground vc-modified :background bg)))