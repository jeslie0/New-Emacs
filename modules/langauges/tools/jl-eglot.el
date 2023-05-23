(use-package eglot
  :straight (:type built-in)
  :commands (eglot)
  :hook (eglot-managed-mode . (lambda ()
                                (make-local-variable 'completion-at-point-functions)
                                (setq-local completion-at-point-functions (list (cape-super-capf #'eglot-completion-at-point #'cape-dabbrev)))))
  :general
  (jl/lsp-keys
    :keymaps 'eglot-mode-map
    :states '(normal visual operator)
    "S"  '(:ignore t :which-key "server")
    "B"  '(:ignore t :which-key "buffers")

    "Se" 'eglot
    "Sr" 'eglot-reconnect
    "Ss" 'eglot-shutdown
    "SS" 'eglot-shutdown-all
    "Sc" 'eglot-signal-didChangeConfiguration

    "r"  'eglot-rename
    "f"  'eglot-format
    "a"  'eglot-code-actions
    "D"  'eldoc
    "g"  'xref-find-definitions


    "Be" 'eglot-events-buffer
    "Bs" 'eglot-stderr-buffer)
  :custom
  (eglot-confirm-server-initiated-edits nil)
  (eglot-extend-to-xref)
  :config
  (setq eglot-report-progress nil)
  (add-to-list 'completion-category-overrides '(eglot (styles orderless)))
  (general-define-key
   :keymaps 'eglot-mode-map
   :states '(normal operator)
   "K" #'eldoc-box-help-at-point)
  (add-to-list 'eglot-server-programs '(csharp-mode . ("OmniSharp" "-lsp")))
  (add-to-list 'eglot-server-programs '(csharp-tree-sitter-mode . ("OmniSharp" "-lsp")))
  (add-to-list 'eglot-server-programs `(python-ts-mode . ,(eglot-alternatives '("pylsp" "pyls" ("pyright-langserver" "--stdio") "jedi-language-server"))))
  (add-to-list 'eglot-server-programs `((c-ts-mode c++-ts-mode) . ,(eglot-alternatives '("clangd" "ccls"))))
  (add-to-list 'eglot-server-programs '(cmake-ts-mode . ("cmake-language-server")))
  (add-to-list 'eglot-server-programs '(nix-mode . ("nil"))))

(use-package consult-eglot
  :after (consult eglot)
  :general
  (jl/lsp-keys
    :keymaps 'eglot-mode-map
    :states '(normal visual operator)
    "=s" #'consult-eglot-symbols))

(use-package breadcrumb
  :defer t
  :straight (:host github :repo "joaotavora/breadcrumb" :files ("breadcrumb.el"))
  :hook (eglot-managed-mode . breadcrumb-local-mode))
