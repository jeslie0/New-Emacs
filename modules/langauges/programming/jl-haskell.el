(defun jl/haskell-keys ()
  (jl/major-modes
    :keymaps 'haskell-mode-map
    :states '(normal visual operator)
    :major-modes t
    "g" '(:ignore t :which-key "navigation")
    "s" '(:ignore t :which-key "repl")
    "c" '(:ignore t :which-key "cabal")
    "h" '(:ignore t :which-key "documentation")
    "d" '(:ignore t :which-key "debug")
    "r" '(:ignore t :which-key "refactor"))

  (jl/major-modes
    :keymaps 'haskell-mode-map
    :states '(normal visual operator)
    :major-modes t
    "'" 'haskell-interactive-switch
    "S" 'haskell-mode-stylish-buffer

    "sb"  'haskell-process-load-file
    "sc"  'haskell-interactive-mode-clear
    "sS"  'spacemacs/haskell-interactive-bring
    "ss"  'haskell-interactive-switch
    "st"  'haskell-session-change-target
    "'"   'haskell-interactive-switch

    "ca"  'haskell-process-cabal
    "cb"  'haskell-process-cabal-build
    "cc"  'haskell-compile
    "cv"  'haskell-cabal-visit-file

    "hd"  'inferior-haskell-find-haddock
    "hg"  'hoogle
    "hG"  'haskell-hoogle-lookup-from-local
    "hi"  'haskell-process-do-info
    "ht"  'haskell-process-do-type
    "hT"  'haskell-process-do-type-on-prev-line

    "da"  'haskell-debug/abandon
    "db"  'haskell-debug/break-on-function
    "dB"  'haskell-debug/delete
    "dc"  'haskell-debug/continue
    "dd"  'haskell-debug
    "dn"  'haskell-debug/next
    "dN"  'haskell-debug/previous
    "dp"  'haskell-debug/previous
    "dr"  'haskell-debug/refresh
    "ds"  'haskell-debug/step
    "dt"  'haskell-debug/trace

    "ri"  'haskell-format-imports)

  (general-define-key
   :states '(normal insert visual)
   :keymaps 'haskell-interactive-mode-map
   "C-j" 'haskell-interactive-mode-history-next
   "C-k" 'haskell-interactive-mode-history-previous
   "C-l" 'haskell-interactive-mode-clear)

  (jl/major-modes
    :states '(normal visual)
    :keymaps 'haskell-cabal-mode-map
    :major-modes t
    "d"   'haskell-cabal-add-dependency
    "b"   'haskell-cabal-goto-benchmark-section
    "e"   'haskell-cabal-goto-executable-section
    "t"   'haskell-cabal-goto-test-suite-section
    "m"   'haskell-cabal-goto-exposed-modules
    "l"   'haskell-cabal-goto-library-section
    "n"   'haskell-cabal-next-subsection
    "p"   'haskell-cabal-previous-subsection
    "N"   'haskell-cabal-next-section
    "P"   'haskell-cabal-previous-section
    "f"   'haskell-cabal-find-or-create-source-file))

(use-package haskell-mode
  :hook ((haskell-mode . auto-fill-mode))
  :general
  (:keymaps 'haskell-mode-map
            :states 'normal
            "o" 'haskell-evil-open-below
            "O" 'haskell-evil-open-above)
  :init
  ;; ;; To get evil's "o" and "O" keys to work with indentation as expected, we use these two functions from [[https://github.com/haskell/haskell-mode/issues/1265#issuecomment-252492026][hatashiro]].
  (defun haskell-evil-open-above ()
    (interactive)
    (evil-digit-argument-or-evil-beginning-of-line)
    (haskell-indentation-newline-and-indent)
    (evil-previous-line)
    (haskell-indentation-indent-line)
    (evil-append-line nil))

  (defun haskell-evil-open-below ()
    (interactive)
    (evil-append-line nil)
    (haskell-indentation-newline-and-indent))

  (defun haskell-format-imports ()
    "Sort and align import statements from anywhere in the source file."
    (interactive)
    (save-excursion
      (haskell-navigate-imports)
      (haskell-mode-format-imports)))

  (defun haskell-process-do-type-on-prev-line ()
    (interactive)
    (haskell-process-do-type 1))
  (remove-hook 'haskell-mode-hook 'electric-indent-mode)
  :config
  (jl/haskell-keys)
  :custom
  (haskell-process-type 'auto))

(use-package hindent
  :after haskell-mode
  :general
  (jl/major-modes
    :states '(normal visual operator)
    :keymaps 'haskell-mode-map
    :major-modes t
    "f" '(:ignore nil :which-key "format")
    "fB" 'hindent-reformat-buffer
    "fd" 'hindent-reformat-decl
    "ff" 'hindent-reformat-decl-or-fill
    "fr" 'hindent-reformat-region)
  :hook (haskell-mode . hindent-mode))

(use-package hlint-refactor
  :hook (haskell-mode . hlint-refactor-mode)
  :general
  (jl/major-modes
    :states '(normal visual)
    :keymaps 'haskell-mode-map
    :major-modes t
    "rb" 'hlint-refactor-refactor-buffer
    "rr" 'hlint-refactor-refactor-at-point))

(use-package lsp-haskell
  :defer t
  ;; :hook ((haskell-mode . lsp)
  ;;        (haskell-mode . lsp-mode)
  ;;        (haskell-literate-mode . lsp)
  ;;        (haskell-mode . lsp-mode))
  :custom
  (lsp-haskell-server-path "haskell-language-server-wrapper")
  (lsp-haskell-server-args ()))
