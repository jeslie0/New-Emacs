;;; jl-undo-tree.el --- jl undo-tree configuration -*- lexical-binding: t -*-

;; Author: James Leslie <jamesleslie@posteo.net>
;; Created: 13-06-2022


;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:

;; commentary

;;; Code:

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
  (:states 'normal
   "p" 'counsel-yank-pop
   "C-r" 'undo-tree-redo
   "u" 'undo-tree-undo)
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

(provide 'jl-undo-tree)
;;; jl-undo-tree.el ends here
