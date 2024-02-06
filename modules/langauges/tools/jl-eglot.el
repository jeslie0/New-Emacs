(use-package eglot
  :straight (eglot :type git
                   :host nil
                   :repo "git://git.sv.gnu.org/emacs.git"
                   :files ("lisp/progmodes/eglot.el"))
  :commands (eglot)
  :hook (eglot-managed-mode . (lambda ()
                                ;; (make-local-variable 'completion-at-point-functions)
                                (setq-local completion-at-point-functions
                                            (list (cape-super-capf
                                                   #'eglot-completion-at-point
                                                   #'cape-dabbrev
                                                   #'yasnippet-capf
                                                   )))))
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
  ;; (advice-add 'eglot-completion-at-point :around #'cape-wrap-buster)
  ;; (setq eglot-report-progress nil)
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
  (add-to-list 'eglot-server-programs '(nix-mode . ("nil")))
  ;; Speedups?
  (fset #'jsonrpc--log-event #'ignore)
  (setq eglot-events-buffer-size 0)
  (setq eglot-sync-connect nil)
  (setq eglot-connect-timeout nil)

    ;; I'm not sure why this is needed, but it throws an error if I remove it
    (cl-defmethod project-root ((project (head eglot-project)))
      (cdr project))

    (defun my-project-try-tsconfig-json (dir)
      (when-let* ((found (or (locate-dominating-file dir "jsconfig.json") (locate-dominating-file dir "tsconfig.json"))))
        (cons 'eglot-project found)))

    (add-hook 'project-find-functions
              'my-project-try-tsconfig-json nil nil)

    (add-to-list 'eglot-server-programs
                 '((typescript-mode) "typescript-language-server" "--stdio"))
  )

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
