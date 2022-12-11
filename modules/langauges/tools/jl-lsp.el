(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :general
  (jl/lsp-keys
    :keymaps 'lsp-mode-map
    :states '(normal visual motion)
    "=" '(:ignore t :which-key "format")
    "==" #'lsp-format-buffer
    "=r" #'lsp-format-region

    "a" '(:ignore t :which-key "action")
    "aa" #'lsp-execute-code-action
    "al" #'lsp-avy-lens
    "ah" #'lsp-document-highlight
    "as" #'lsp-ui-sideline-apply-code-actions

    "F" '(:ignore t :which-key "folders")
    "Fa" #'lsp-workspace-folders-add
    "Fr" #'lsp-workspace-folders-remove
    "Fs" #'lsp-workspace-folders-switch
    "Fb" #'lsp-workspace-blacklist-remove

    "g" '(:ignore t :which-key "go-to")
    "gg" #'lsp-find-definition
    "gr" #'lsp-find-references
    "gi" #'lsp-find-implementation
    "gt" #'lsp-find-type-definition
    "gd" #'lsp-find-declaration
    ;; "ga" #'lsp-find-m

    "G" '(:ignore t :which-key "peek")
    "Gg" #'lsp-ui-peek-find-definitions
    "Gr" #'lsp-ui-peek-find-references
    "Gi" #'lsp-ui-peek-find-implementation
    "Gs" #'lsp-ui-peek-find-workspace-symbol

    "h" '(:ignore t :which-key "help")
    "hh" #'lsp-describe-thing-at-point
    "hs" #'lsp-signature-activate
    "hg" #'lsp-ui-doc-show

    "r" '(:ignore t :which-key "organize")
    "rr" #'lsp-rename
    "ro" #'lsp-organize-imports

    "T" '(:ignore t :which-key "toggle")
    "Tl" #'lsp-lens-mode
    "TL" #'lsp-toggle-trace-io
    "Th" #'lsp-toggle-symbol-highlight
    "TS" #'lsp-ui-sideline-mode
    "Td" #'lsp-ui-doc-mode
    "Ts" #'lsp-toggle-signature-auto-activate
    "Tf" #'lsp-toggle-on-type-formatting
    "TT" #'lsp-treemacs-sync-mode
    "Tld" #'lsp-ui-doc-mode
    "Tls" #'lsp-ui-sideline-mode

    "w" '(:ignore t :which-key "workspaces")
    "ws" #'lsp
    "wr" #'lsp-workspace-restart
    "wq" #'lsp-workspace-shutdown
    "wd" #'lsp-describe-session
    "wD" #'lsp-disconnect
    "wv" #'lsp-version)
  ;; (advice-add 'lsp :before #'direnv-update-environment)
  :custom
  (lsp-modeline-code-actions-enable nil)
  (lsp-idle-delay 0.500)
  (lsp-lens-place-position 'above-line)
  (lsp-log-io nil)
  (lsp-headerline-breadcrumb-icons-enable nil)
  (lsp-file-watch-ignored '("[/\\\\]\\.direnv$"
					; SCM tools
			    "[/\\\\]\\.git$"
			    "[/\\\\]\\.hg$"
			    "[/\\\\]\\.bzr$"
			    "[/\\\\]_darcs$"
			    "[/\\\\]\\.svn$"
			    "[/\\\\]_FOSSIL_$"
					; IDE tools
			    "[/\\\\]\\.idea$"
			    "[/\\\\]\\.ensime_cache$"
			    "[/\\\\]\\.eunit$"
			    "[/\\\\]node_modules$"
			    "[/\\\\]\\.fslckout$"
			    "[/\\\\]\\.tox$"
			    "[/\\\\]\\.stack-work$"
			    "[/\\\\]\\.bloop$"
			    "[/\\\\]\\.metals$"
			    "[/\\\\]target$"
					; Autotools output
			    "[/\\\\]\\.deps$"
			    "[/\\\\]build-aux$"
			    "[/\\\\]autom4te.cache$"
			    "[/\\\\]\\.reference$"
					; Haskell stuff
			    "[/\\\\]\\dist-newstyle$"
			    )))
(use-package lsp-ui
  :after (lsp)
  :commands (lsp-ui-mode)
  :custom
  (lsp-lens-enable 1)
  (lsp-ui-doc-show-with-mouse nil)
  (lsp-ui-doc-show-with-cursor t))

(use-package lsp-treemacs
  :general
  (jl/major-modes
    :keymaps 'lsp-mode-map
    :states '(normal visual motion)
    "t" '(:ignore t :which-key "lsp-treemacs")
    "th" #'lsp-treemacs-call-hierarchy
    "te" #'lsp-treemacs-errors-list
    "tr" #'lsp-treemacs-references
    "ts" #'lsp-treemacs-symbols)
  :config
  (lsp-treemacs-sync-mode 1))
