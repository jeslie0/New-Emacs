(use-package eglot
  :commands (eglot)
  :hook (eglot-managed-mode . (lambda ()
                                (make-local-variable 'completion-at-point-functions)
                                (setq-local completion-at-point-functions (list (cape-super-capf #'eglot-completion-at-point #'cape-dabbrev)))))
  :general
  (jl/major-modes
    :keymaps 'eglot-mode-map
    :states '(normal visual operator)
    "="   '(:ignore t :which-key "eglot")
    "=S"  '(:ignore t :which-key "server")
    "=B"  '(:ignore t :which-key "buffers")

    "=Se" 'eglot
    "=Sr" 'eglot-reconnect
    "=Ss" 'eglot-shutdown
    "=SS" 'eglot-shutdown-all
    "=Sc" 'eglot-signal-didChangeConfiguration

    "=r"  'eglot-rename
    "=f"  'eglot-format
    "=a"  'eglot-code-actions
    "=D"  'eldoc
    "=g"  'xref-find-definitions


    "=Be" 'eglot-events-buffer
    "=Bs" 'eglot-stderr-buffer)
  :custom
  (eglot-confirm-server-initiated-edits nil)
  (eglot-extend-to-xref)
  :config
  (add-to-list 'completion-category-overrides '(eglot (styles orderless)))
  (general-define-key
   :keymaps 'eglot-mode-map
   :states '(normal operator)
   "K" 'eldoc-box-eglot-help-at-point)
  (add-to-list 'eglot-server-programs '(csharp-mode . ("OmniSharp" "-lsp")))
  (add-to-list 'eglot-server-programs '(csharp-tree-sitter-mode . ("OmniSharp" "-lsp")))
  (add-to-list 'eglot-server-programs '(python-mode . ("python-language-server" ""))))

(use-package consult-eglot
  :after (consult eglot)
  :general
  (jl/major-modes
    :keymaps 'eglot-mode-map
    :states '(normal visual operator)
    "=s" #'consult-eglot-symbols))
