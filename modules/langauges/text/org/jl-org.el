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
    "c" '(:ignore t :which-key "clock")
    "x" '(:ignore t :which-key "Text")

    "'" 'org-edit-special

    ;; Clock
    ;; These keybindings should match those under the "aoC" prefix (below)
    "cc" 'org-clock-cancel
    "cd" 'org-clock-display
    "ce" 'org-evaluate-time-range
    "cg" 'org-clock-goto
    "ci" 'org-clock-in
    "cI" 'org-clock-in-last
    ;c "Cj" 'spacemacs/org-clock-jump-to-current-clock
    "co" 'org-clock-out
    "cR" 'org-clock-report
    "cr" 'org-resolve-clocks

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
    "o" '(:ignore t :which-key "org")
    "oc" '(:ignore t :which-key "clock")
    "of" '(:ignore t :which-key "feeds")

    "o#" 'org-agenda-list-stuck-projects
    "oa" 'org-agenda-list
    "oo" 'org-agenda
    "oc" 'org-capture
    "oe" 'org-store-agenda-views
    "ofi" 'org-feed-goto-inbox
    "ofu" 'org-feed-update-all

    ;;; Clock
    ;; These keybindings should match those under the "mC" prefix (above)
    "occ" 'org-clock-cancel
    "ocg" 'org-clock-goto
    "oci" 'org-clock-in
    "ocI" 'org-clock-in-last
    "oco" 'org-clock-out
    "ocr" 'org-resolve-clocks

    "ol" 'org-store-link
    "om" 'org-tags-view
    "os" 'org-search-view
    "ot" 'org-todo-list
    ;; SPC C- capture/colors
    "Cc" 'org-capture))

(defun jl/org-mode-Cc-keys ()
  (jl/C-c-keys
    "a" 'org-agenda
    "c" 'org-capture
    "l" 'org-store-link))


;;; Org Font Setup
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

;;; LaTeX Previews
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

;;; Org
(use-package org
  :defer t
  :hook ((org-mode . jl/org-font-setup))
  :init
  (jl/org-mode-Cc-keys)
  (jl/org-mode-global-keys)
  :config
  (setq
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
   org-preview-latex-image-directory "~/Documents/Org/ltximg/"
   org-export-backends '(ascii beamer html icalendar latex md odt)
   ;; Latex in Org
   org-preview-latex-default-process 'luasvg
   org-latex-compiler "lualatex"
   org-highlight-latex-and-related '(latex script entities)
   org-format-latex-options (plist-put org-format-latex-options :background "Transparent"))


  (jl/org-mode-key-bindings)
  (jl/org-font-setup)
  (jl/org-luasvg)
  (add-to-list 'org-file-apps '("\\.pdf" . "zathura %s"))
  :custom
  (org-agenda-files '("~/Documents/Calendar/Agenda.org"))
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

(use-package org-clock
  :straight org
  :defer t
  :config
  (setq org-clock-clocktable-default-properties (plist-put org-clock-clocktable-default-properties :maxlevel 5)))


;;; Org Roam
(defun org-roam-force-rebuild-cache ()
  "Rebuild the `org-mode' and `org-roam' cache."
  (interactive)
  (org-id-update-id-locations)
  ;; Note: you may need `org-roam-db-clear-all'
  ;; followed by `org-roam-db-sync'
  (org-roam-db-sync)
  (org-roam-update-org-id-locations))

(defun jl/org-roam-global-keys ()
  (jl/SPC-keys
    "aor" '(:ignore t :which-key "org-roam")
    "aord" '(:ignore t :which-key "dailies")
    "aort" '(:ignore t :which-key "tags")

    "aordy" 'org-roam-dailies-goto-yesterday
    "aordt" 'org-roam-dailies-goto-today
    "aordT" 'org-roam-dailies-goto-tomorrow
    "aordd" 'org-roam-dailies-goto-date
    "aorh" 'org-roam-force-rebuild-cache
    "aorf" 'org-roam-node-find
    "aorn" 'org-roam-node-find
    "aorg" 'org-roam-ui-open
    "aori" 'org-roam-node-insert
    "aorl" 'org-roam-buffer-toggle
    "aorta" 'org-roam-tag-add
    "aortr" 'org-roam-tag-remove
    "aora" 'org-roam-alias-add
    "aorI" 'org-id-get-create))

(defun jl/org-roam-key-bindings ()
  (jl/major-modes
    :states '(normal visual motion)
    :keymaps 'org-mode-map
    :major-modes t

    "r" '(:ignore t :which-key "org-roam")
    "rd" '(:ignore t :which-key "dailies")
    "rt" '(:ignore t :which-key "tags")
    "rdy" 'org-roam-dailies-goto-yesterday
    "rdt" 'org-roam-dailies-goto-today
    "rdT" 'org-roam-dailies-goto-tomorrow
    "rdd" 'org-roam-dailies-goto-date
    "rf" 'org-roam-node-find
    "rh" 'org-roam-force-rebuild-cache
    "rn" 'org-roam-node-find
    "rg" 'org-roam-ui-open
    "ri" 'org-roam-node-insert
    "rl" 'org-roam-buffer-toggle
    "rta" 'org-roam-tag-add
    "rtr" 'org-roam-tag-remove
    "ra" 'org-roam-alias-add
    "rI" 'org-id-get-create))
(defun jl/org-roam-templates ()
  (setq org-roam-capture-templates
        '(("q" "quick note" plain
           "%?"
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)

          ("e" "encrypted note" plain
           "%?"
           :if-new (file+head "./encrypted/%<%Y%m%d%H%M%S>-${slug}.org.gpg" "#+title: ${title}\n")
           :unnarrowed t)

          ("m" "mathematics note" plain
           "#+LATEX_HEADER: \\input{org-math-packages.tex} \\usepackage{math-macros} \\usepackage{math-environments}\n\n* %?"
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)

          ("f" "film note" plain
           "%?"
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :films:\n[[id:352cef44-05f6-494c-8f65-c04241335eb0][Films]]\n* %?")
           :unnarrowed t)
          )))

(defun jl/org-roam-daily-templates ()
  (setq org-roam-dailies-capture-templates
        '(("d" "default" entry
           "* %?"
           :target (file+datetree "journal.org" day)))))
(use-package org-roam
  :defer t
  :commands (org-roam-node-find
             org-roam-dailies-goto-date
             org-roam-dailies-goto-today
             org-roam-dailies-goto-tomorrow
             org-roam-dailies-goto-yesterday)
  :custom
  (org-roam-v2-ack t)
  (org-roam-graph-viewer #'browse-url-firefox)
  (org-roam-directory "~/Documents/Roam/")
  (org-roam-node-display-template (concat "${title:*} " (propertize "${tags}" 'face 'org-tag)))
  :init
  (jl/org-roam-global-keys)
  (jl/org-roam-daily-templates)
  (jl/org-roam-templates)
  :config
  (add-to-list 'org-agenda-files "~/Documents/Roam/daily")
  (org-roam-db-autosync-mode)
  (jl/org-roam-key-bindings))

;;; Org Roam Ui
(use-package org-roam-ui
  :defer t
  :commands (org-roam-ui-mode
             org-roam-ui-open)
  :after org-roam)

;;; Org Roam BibTeX
(use-package org-roam-bibtex
  :after (org-roam)
  :defer t
  :hook (org-roam-mode . org-roam-bibtex-mode))

;;; Org Roam Protocol
(use-package org-roam-bibtex
  :after (org-roam)
  :defer t
  :hook (org-roam-mode . org-roam-bibtex-mode))

;;; Org Minor Modes

(use-package org-superstar
  :defer t
  :after org
  :hook (org-mode . org-superstar-mode))

(defun jl/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :defer t
  :hook (org-mode . jl/org-mode-visual-fill))

(use-package org-fragtog
  :defer t
  :after org
  :hook (org-mode . org-fragtog-mode)
  )

;;; Org Babel
;; Calling org-babel languages in the following form saves a lot on startup time.

(use-package ob-shell
  :straight org
  :commands
  (org-babel-execute:sh
   org-babel-expand-body:sh

   org-babel-execute:bash
   org-babel-expand-body:bash)
  :config
  (add-to-list 'org-babel-load-languages '(shell . t)))

(use-package ob-python
  :straight org
  :commands
  (org-babel-execute:python
   org-babel-expand-body:python))

(use-package ob-emacs-lisp
  :straight org
  :commands
  (org-babel-execute:emacs-lisp
   org-babel-expand-body:emacs-lisp
   org-babel-execute:elisp
   org-babel-expand-body:elisp))

(use-package ob-js
  :straight org
  :commands
  (org-babel-execute:js
   org-babel-expand-body:js))

(use-package ob-latex
  :straight org
  :commands
  (org-babel-execute:latex
   org-babel-expand-body:latex))

(use-package ob-haskell
  :straight org
  :commands
  (org-babel-execute:haskell
   org-babel-expand-body:haskell))

(use-package ob-C
  :straight org
  :commands
  (org-babel-execute:C
   org-babel-expand-body:C
   org-babel-execute:C++
   org-babel-expand-body:C++))

;;; Evil Org
(use-package evil-org
  :defer t
  :after org
  :hook ((org-mode . evil-org-mode)
         (evil-org-mode . evil-org-set-key-theme))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))


;;; Org Present
(use-package org-present
  :defer t
  :after org
  :straight (:host github
                   :repo "rlister/org-present"
                   :branch "master"))

;;; Org Capture
(with-eval-after-load 'org-capture
  (defun org-capture-start ()
    "Make sure that the keybindings are available for org capture."
    (jl/C-c-keys
      :keymaps 'org-capture-mode-map
      "a" 'org-capture-kill
      "c" 'org-capture-finalize
      "k" 'org-capture-kill
      "r" 'org-capture-refile)
    ;; Evil bindins seem not to be applied until at least one
    ;; Evil state is executed
    (evil-normal-state))
  ;; Must be done everytime we run org-capture otherwise it will
  ;; be ignored until insert mode is entered.
  (add-hook 'org-capture-mode-hook 'org-capture-start))

;;; toc org
(use-package toc-org
  :defer t
  :after org
  :hook (org-mode . toc-org-mode)
  )

;;; OX Publish
(use-package ox-publish
  :defer t
  :after org
  :straight org)

;;; Engrave Faces
(use-package engrave-faces
  :after org
  :config
  (setq org-latex-src-block-backend 'engraved))
