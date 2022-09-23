(use-package slime
  :defer t
  :init
  (setq inferior-lisp-program "sbcl")
  :general
  (jl/major-modes
    :keymaps 'lisp-mode-map
    :states '(normal visual operator)
    :major-modes t
    "h" '(:ignore t :which-key "help")
    "e" '(:ignore t :which-key "eval")
    "s" '(:ignore t :which-key "repl")
    "c" '(:ignore t :which-key "compile")
    "g" '(:ignore t :which-key "nav")
    "m" '(:ignore t :which-key "macro")
    "t" '(:ignore t :which-key "toggle")
    "'" 'slime

    "cc" 'slime-compile-file
    "cC" 'slime-compile-and-load-file
    "cl" 'slime-load-file
    "cf" 'slime-compile-defun
    "cr" 'slime-compile-region
    "cn" 'slime-remove-notes

    "eb" 'slime-eval-buffer
    "ef" 'slime-eval-defun
    "eF" 'slime-undefine-function
    "ee" 'slime-eval-last-expression
    "el" 'spacemacs/slime-eval-sexp-end-of-line
    "er" 'slime-eval-region

    "gb" 'slime-pop-find-definition-stack
    "gn" 'slime-next-note
    "gN" 'slime-previous-note

    "ha" 'slime-apropos
    "hA" 'slime-apropos-all
    "hd" 'slime-disassemble-symbol
    "hh" 'slime-describe-symbol
    "hH" 'slime-hyperspec-lookup
    "hi" 'slime-inspect-definition
    "hp" 'slime-apropos-package
    "ht" 'slime-toggle-trace-fdefinition
    "hT" 'slime-untrace-all
    "h<" 'slime-who-calls
    "h>" 'slime-calls-who
    ;; TODO: Add key bindings for who binds/sets globals?
    "hr" 'slime-who-references
    "hm" 'slime-who-macroexpands
    "hs" 'slime-who-specializes

    "ma" 'slime-macroexpand-all
    "mo" 'slime-macroexpand-1

    "se" 'slime-eval-last-expression-in-repl
    "si" 'slime
    "sq" 'slime-quit-lisp

    "tf" 'slime-toggle-fancy-trace))

(use-package evil-cleverparens
  :hook ((common-lisp-mode emacs-lisp-mode) . evil-cleverparens-mode)
  :defer t)

(jl/SPC-keys
  "e"  '(:ignore t :which-key "elisp")
  "er" 'eval-region
  "eb" 'eval-buffer)

(add-hook 'emacs-lisp-mode-hook 'electric-pair-local-mode)

(use-package ielm
  :general
  (jl/major-modes
    :states '(normal operator motion)
    :keymaps 'inferior-emacs-lisp-mode-map
    :major-modes t
    "hh" 'helpful-at-point)

  (jl/major-modes
    :states '(normal operator motion)
    :keymaps 'emacs-lisp-mode-map
    :major-modes t
    "'" 'ielm))

(use-package debug
  :defer t)

(use-package edebug
  :general
  (jl/major-modes
    :keymaps 'edebug-eval-mode-map
    :states '(normal visual operator)
    :major-modes t
    "g" '(:ignore t :which-key "goto")
    "e" '(:ignore t :which-key "eval")
    "gw" 'edebug-where
    "a" 'edebug-delete-eval-item
    "k" 'edebug-delete-eval-item
    "," 'edebug-update-eval-list
    "c" 'edebug-update-eval-list
    "ee" 'edebug-eval-last-sexp
    "eE" 'edebug-eval-print-last-sexp))
