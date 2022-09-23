(use-package git-gutter
  :general
  (jl/SPC-keys
    "gg"  '(:ignore t :which-key "gutter")
    "ggn" 'git-gutter:next-hunk
    "gge" 'git-gutter:end-of-hunk
    "ggm" 'git-gutter:mark-hunk
    "ggP" 'git-gutter:popup-hunk
    "ggp" 'git-gutter:previous-hunk
    "ggr" 'git-gutter:revert-hunk
    "ggR" 'git-gutter:set-start-revision
    "ggs" 'git-gutter:stage-hunk
    "ggts" 'git-gutter:start-update-timer
    "ggtc" 'git-gutter:cancel-update-timer
    "ggS" 'git-gutter:statistic
    "ggu" 'git-gutter:update-all-windows)

  :hook ((prog-mode text-mode) . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.01
        git-gutter:handled-backends '(git svn)))
(global-git-gutter-mode 1)

(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))
#+end_src
