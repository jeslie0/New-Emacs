(use-package diff-hl
  :defer t
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
  :init
  (unless (display-graphic-p)
    ((add-hook 'prog-mode-hook #'diff-hl-margin-mode)
     (add-hook 'text-mode-hook #'diff-hl-margin-mode)))
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
  (require 'vc)
  (defun update-diff-hl-fringes ()
    "Updates the diff-hl fringe faces to match the theme."
    (set-face-attribute 'diff-hl-insert nil :background (face-attribute 'fringe :background))
    (set-face-attribute 'diff-hl-delete nil :background (face-attribute 'fringe :background))
    (set-face-attribute 'diff-hl-change nil :background (face-attribute 'fringe :background))
    (define-fringe-bitmap 'diff-hl-insert
      [#b00000011] nil nil '(center repeated))
    (define-fringe-bitmap 'diff-hl-change
      [#b00000011] nil nil '(center repeated))
    (define-fringe-bitmap 'diff-hl-delete
      [#b00000011] nil nil '(center repeated)))
  (update-diff-hl-fringes)
  (add-hook 'after-load-theme-hook 'update-diff-hl-fringes))
