(use-package undo-tree
  :hook ((prog-mode text-mode) . undo-tree-mode)
  :commands (undo-tree-visualize)
  :general
  (:states '(normal motion)
           :keymaps 'undo-tree-visualizer-mode-map
           "j"  'undo-tree-visualize-redo
           "k"  'undo-tree-visualize-undo
           "h"  'undo-tree-visualize-switch-branch-left
           "l"  'undo-tree-visualize-switch-branch-right)
  (jl/SPC-keys
    "au" 'undo-tree-visualize)
  :custom
  (undo-tree-history-directory-alist '(("." . "~/.emacs.d/tmp/undotree/")))
  (undo-tree-visualizer-timestamps t)
  (undo-tree-visualizer-diff t)
  ;; 10X bump of the undo limits to avoid issues with premature
  ;; Emacs GC which truncages the undo history very aggresively
  (undo-limit 800000)
  (undo-strong-limit 12000000)
  (undo-outer-limit 120000000)
  :config
  (global-undo-tree-mode))
