;;; jl-org.el --- jl org configuration -*- lexical-binding: t -*-

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

;;; Functions
(defun org-link ()
  (interactive)
  (if (string= (car (org-thing-at-point)) "link")
      (org-return)
    (evil-ret)))

(defun org-bold ()
  (interactive)
  (org-emphasize ?\*))

(defun org-italic ()
  (interactive)
  (org-emphasize ?\/))

(defun org-underline ()
  (interactive)
  (org-emphasize ?\_))

(defun org-code ()
  (interactive)
  (org-emphasize ?\~))

(defun org-strike-through ()
  (interactive)
  (org-emphasize ?\+))

(defun org-verbatim ()
  (interactive)
  (org-emphasize ?\=))


;;; Keybindings
(defun jl/org-mode-key-bindings ()
  (general-define-key
   :keymaps 'org-mode-map
   :states '(normal visual motion)
   "RET" 'org-open-at-point ;; Allows links to be opened with RET
   "$"   'end-of-line       ;; Evil-org changes this behaviour. This changes it back.
   "0"   'beginning-of-line)

  (jl/major-modes
    :states '(normal visual)
    :keymaps 'org-mode-map
    :major-modes '(org-mode t)
    "b" '(:ignore t :which-key "Babel")
    "d" '(:ignore t :which-key "Dates")
    "e" '(:ignore t :which-key "Export")
    "f" '(:ignore t :which-key "Feeds")
    "i" '(:ignore t :which-key "Insert")
    "iD" '(:ignore t :which-key "Download")
    "m" '(:ignore t :which-key "More")
    "s" '(:ignore t :which-key "Trees/Subtrees")
    "T" '(:ignore t :which-key "Toggles")
    "t" '(:ignore t :which-key "Tables")
    "td" '(:ignore t :which-key "Delete")
    "ti" '(:ignore t :which-key "Insert")
    "tt" '(:ignore t :which-key "Toggle")
    "C" '(:ignore t :which-key "Clocks")
    "x" '(:ignore t :which-key "Text")

    "'" 'org-edit-special
    "c" 'org-capture

    ;; Clock
    ;; These keybindings should match those under the "aoC" prefix (below)
    "Cc" 'org-clock-cancel
    "Cd" 'org-clock-display
    "Ce" 'org-evaluate-time-range
    "Cg" 'org-clock-goto
    "Ci" 'org-clock-in
    "CI" 'org-clock-in-last
    ;; "Cj" 'spacemacs/org-clock-jump-to-current-clock
    "Co" 'org-clock-out
    "CR" 'org-clock-report
    "Cr" 'org-resolve-clocks

    "dd" 'org-deadline
    "ds" 'org-schedule
    "dt" 'org-time-stamp
    "dT" 'org-time-stamp-inactive
    "ee" 'org-export-dispatch
    "fi" 'org-feed-goto-inbox
    "fu" 'org-feed-update-all

    "a" 'org-agenda

    "p" 'org-priority

    "Tc" 'org-toggle-checkbox
    "Te" 'org-toggle-pretty-entities
    "Ti" 'org-toggle-inline-images
    "Tn" 'org-num-mode
    "Tl" 'org-toggle-link-display
    "Tt" 'org-show-todo-tree
    "TT" 'org-todo
    "TV" 'space-doc-mode
    "Tx" 'org-latex-preview

    ;; More cycling options (timestamps, headlines, items, properties)
    "L" 'org-shiftright
    "H" 'org-shiftleft
    "J" 'org-shiftdown
    "K" 'org-shiftup

    ;; Change between TODO sets
    "C-S-l" 'org-shiftcontrolright
    "C-S-h" 'org-shiftcontrolleft
    "C-S-j" 'org-shiftcontroldown
    "C-S-k" 'org-shiftcontrolup

    ;; Subtree editing
    "sa" 'org-toggle-archive-tag
    "sA" 'org-archive-subtree-default
    "sb" 'org-tree-to-indirect-buffer
    "sd" 'org-cut-subtree
    "sy" 'org-copy-subtree
    "sh" 'org-promote-subtree
    "sj" 'org-move-subtree-down
    "sk" 'org-move-subtree-up
    "sl" 'org-demote-subtree
    "sn" 'org-narrow-to-subtree
    "sw" 'widen
    "sr" 'org-refile
    "ss" 'org-sparse-tree
    "sS" 'org-sort

    ;; tables
    "ta" 'org-table-align
    "tb" 'org-table-blank-field
    "tc" 'org-table-convert
    "tdc" 'org-table-delete-column
    "tdr" 'org-table-kill-row
    "te" 'org-table-eval-formula
    "tE" 'org-table-export
    "tf" 'org-table-field-info
    "th" 'org-table-previous-field
    "tH" 'org-table-move-column-left
    "tic" 'org-table-insert-column
    "tih" 'org-table-insert-hline
    "tiH" 'org-table-hline-and-move
    "tir" 'org-table-insert-row
    "tI" 'org-table-import
    "tj" 'org-table-next-row
    "tJ" 'org-table-move-row-down
    "tK" 'org-table-move-row-up
    "tl" 'org-table-next-field
    "tL" 'org-table-move-column-right
    "tn" 'org-table-create
    "tN" 'org-table-create-with-table.el
    "tr" 'org-table-recalculate
    "tR" 'org-table-recalculate-buffer-tables
    "ts" 'org-table-sort-lines
    "ttf" 'org-table-toggle-formula-debugger
    "tto" 'org-table-toggle-coordinate-overlays
    "tw" 'org-table-wrap-region

    ;; Source blocks / org-babel
    "bp"     'org-babel-previous-src-block
    "bn"     'org-babel-next-src-block
    "be"     'org-babel-execute-maybe
    "bo"     'org-babel-open-src-block-result
    "bv"     'org-babel-expand-src-block
    "bu"     'org-babel-goto-src-block-head
    "bg"     'org-babel-goto-named-src-block
    "br"     'org-babel-goto-named-result
    "bb"     'org-babel-execute-buffer
    "bs"     'org-babel-execute-subtree
    "bd"     'org-babel-demarcate-block
    "bt"     'org-babel-tangle
    "bf"     'org-babel-tangle-file
    "bc"     'org-babel-check-src-block
    "bj"     'org-babel-insert-header-arg
    "bl"     'org-babel-load-in-session
    "bi"     'org-babel-lob-ingest
    "bI"     'org-babel-view-src-block-info
    "bz"     'org-babel-switch-to-session
    "bZ"     'org-babel-switch-to-session-with-code
    "ba"     'org-babel-sha1-hash
    "bx"     'org-babel-do-key-sequence-in-edit-buffer
    ;; "b."     'spacemacs/org-babel-transient-state/body
    ;; Multi-purpose keys
    "," 'org-ctrl-c-ctrl-c
    "*" 'org-ctrl-c-star
    "-" 'org-ctrl-c-minus
    "#" 'org-update-statistics-cookies
    "RET"   'org-ctrl-c-ret
    "M-RET" 'org-meta-return
    ;; attachments
    "A" 'org-attach
    ;; insertion
    "ib" 'org-insert-structure-template
    "id" 'org-insert-drawer
    "ie" 'org-set-effort
    "if" 'org-footnote-new
    "ih" 'org-insert-heading
    "iH" 'org-insert-heading-after-current
    "ii" 'org-insert-item
    ;; "iK" 'spacemacs/insert-keybinding-org
    "il" 'org-insert-link
    "in" 'org-add-note
    "ip" 'org-set-property
    "is" 'org-insert-subheading
    "it" 'org-set-tags-command
    ;; region manipulation
    "xb" 'org-bold
    "xc" 'org-code
    "xi" 'org-italic
    "xo" 'org-open-at-point
    ;; "xr" (spacemacs|org-emphasize spacemacs/org-clear ? )
    "xs" 'org-strike-through
    "xu" 'org-underline
    "xv" 'org-verbatim)


  (evil-define-minor-mode-key 'normal 'org-src-mode ",c" 'org-edit-src-exit)
  (evil-define-minor-mode-key 'visual 'org-src-mode ",c" 'org-edit-src-exit)

  (evil-define-minor-mode-key 'normal 'org-src-mode ",," 'org-edit-src-exit)
  (evil-define-minor-mode-key 'visual 'org-src-mode ",," 'org-edit-src-exit)

  (evil-define-minor-mode-key 'normal 'org-src-mode ",a" 'org-edit-src-abort)
  (evil-define-minor-mode-key 'visual 'org-src-mode ",a" 'org-edit-src-abort)

  (evil-define-minor-mode-key 'normal 'org-capture-mode ",," 'org-capture-finalize)
  (evil-define-minor-mode-key 'visual 'org-capture-mode ",," 'org-capture-finalize)

  (evil-define-minor-mode-key 'normal 'org-capture-mode ",a" 'org-capture-kill)
  (evil-define-minor-mode-key 'visual 'org-capture-mode ",a" 'org-capture-kill))

;; Add global evil-leader mappings. Used to access org-agenda
;; functionalities – and a few others commands – from any other mode.
(defun jl/org-mode-global-keys ()
  (jl/SPC-keys
   "ao" '(:ignore t :which-key "org")
   "aoC" '(:ignore t :which-key "clocks")
   "aof" '(:ignore t :which-key "feeds")

   "ao#" 'org-agenda-list-stuck-projects
   "aoa" 'org-agenda-list
   "aoo" 'org-agenda
   "aoc" 'org-capture
   "aoe" 'org-store-agenda-views
   "aofi" 'org-feed-goto-inbox
   "aofu" 'org-feed-update-all

   ;; Clock
   ;; These keybindings should match those under the "mC" prefix (above)
   "aoCc" 'org-clock-cancel
   "aoCg" 'org-clock-goto
   "aoCi" 'org-clock-in
   "aoCI" 'org-clock-in-last
   ;; "aoCj" 'spacemacs/org-clock-jump-to-current-clock
   "aoCo" 'org-clock-out
   "aoCr" 'org-resolve-clocks

   "aol" 'org-store-link
   "aom" 'org-tags-view
   "aos" 'org-search-view
   "aot" 'org-todo-list
   ;; SPC C- capture/colors
   "Cc" 'org-capture))

(defun jl/org-mode-Cc-keys ()
  (jl/C-c-keys
    "a" 'org-agenda
    "c" 'org-capture
    "l" 'org-store-link))
 ;;; Font configuration

(defun jl/org-font-setup ()
  (dolist (face '((org-document-title . 1.5)
		  (org-level-1 . 1.2)
		  (org-level-2 . 1.1)
		  (org-level-3 . 1.05)
		  (org-level-4 . 1.0)
		  (org-level-5 . 1.1)
		  (org-level-6 . 1.1)
		  (org-level-7 . 1.1)
		  (org-level-8 . 1.1))
		)
    (set-face-attribute (car face) nil :family jl/prog-font :weight 'regular :height (cdr face))
    (set-face-attribute 'org-link nil :weight 'regular)
    )

  ;; (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  ;; (set-face-attribute 'org-block nil :inherit 'fixed-pitch)

  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch :family jl/prog-font)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch) :family jl/prog-font)
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch) :family jl/prog-font)
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch) :family jl/prog-font)
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch) :family jl/prog-font)
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch) :family jl/prog-font)
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch :family jl/prog-font)
  (set-face-attribute 'org-latex-and-related nil :inherit 'fixed-pitch :family jl/prog-font))


;;; Latex Rendering
(defun jl/org-luasvg ()
  "Sets up luasvg as a way to render latex fragments"
  (setq luasvg '(luasvg :programs ("lualatex" "dvisvgm")
                        :description "dvi > svg"
                        :message "you need to install lualatex and dvisvgm."
                        :image-input-type "dvi"
                        :image-output-type "svg"
                        :image-size-adjust (1.0 . 1.0)
                        :latex-compiler ("lualatex --interaction=nonstopmode --shell-escape --output-format=dvi --output-directory=%o %f")
                        :image-converter ("dvisvgm %f -n -b min -c %S -o %O")))

  (add-to-list 'org-preview-latex-process-alist luasvg))

;;; Org mode
(use-package org
  :defer t
  :hook ((org-mode . jl/org-font-setup))
  :init
  (jl/org-mode-Cc-keys)
  (jl/org-mode-global-keys)
  :config
  (setq
   org-format-latex-options (plist-put org-format-latex-options :background "Transparent")
   org-ellipsis " ▼"  ;; Change folded header ellipsis
   org-todo-keywords '((sequence "TODO" "WAITING" "|" "DONE" "CANCELLED"))
   org-todo-keyword-faces '(("WAITING" . "aquamarine1") ("CANCELLED" . "red"))
   org-startup-indented t
   org-display-remote-inline-images 'download
   org-hide-emphasis-markers nil
   org-src-tab-acts-natively t
   org-pretty-entities nil
   org-startup-folded t
   org-hide-block-startup t
   org-edit-src-content-indentation 0
   org-startup-with-latex-preview t
   org-enable-reveal-js-support t
   org-protocol-default-template-key "w"
   org-image-actual-width nil
   org-re-reveal-root "file:///home/james/emacs-packages/reveal.js"
   org-preview-latex-image-directory "~/Documents/Org/ltximg/"
   org-export-backends '(ascii beamer html icalendar latex md odt)
   ;; Latex in Org
   org-preview-latex-default-process 'luasvg
   org-latex-compiler "lualatex"
   org-highlight-latex-and-related '(latex script entities))

  (jl/org-mode-key-bindings)
  (jl/org-font-setup)
  (jl/org-luasvg)
  (add-to-list 'org-file-apps '("\\.pdf" . "zathura %s"))
  :custom
  (org-agenda-files '("~/Documents/Calendar/Agenda.org"))
  ;;                     ;; "~/Documents/Org/GTD/inbox.org"
  ;;                     ;; "~/Documents/Org/GTD/gtd.org"
  ;;                     ;; "~/Documents/Org/GTD/tickler.org"
  ;;                     ;; "~/Documents/Org/GTD/Mobile Inbox.org"
  ;;                     ))
  ;; (org-format-latex-options '(:foreground auto :background "Transparent"))
  ;; Org capture
  (org-capture-templates
   '(("t" "Todo [inbox]" entry
      (file+headline "~/Documents/Org/GTD/inbox.org" "Tasks")
      "* TODO %i%?")

     ("T" "Tickler" entry
      (file+headline "~/Documents/Org/GTD/tickler.org" "Tickler")
      "* %i%? \n %U")
     ("n" "Notes" entry
      (file "~/Documents/Org/Notes/notes.org")
      "* %?")
     ("r" "Research Notes" entry
      (file "~/Documents/Org/Research/notes.org")
      "* %u \n %?")
     ("w" "org-protocol" entry (file "~/Documents/Org/GTD/inbox.org")
      "* TODO Review %a\n%U\n%:initial\n" :immediate-finish t)
     ))
  ;; GTD in org
  (org-refile-targets '(("~/Documents/Org/GTD/gtd.org" :maxlevel . 3)
                        ("~/Documents/Org/GTD/someday.org" :level . 1)
                        ("~/Documents/Org/GTD/tickler.org" :maxlevel . 2))))


(provide 'jl-org)
;;; jl-org.el ends here
