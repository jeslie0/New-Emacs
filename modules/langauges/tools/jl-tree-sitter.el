(use-package tree-sitter
  :defer t
  :init (global-tree-sitter-mode)
  :config
  (add-to-list 'tree-sitter-major-mode-language-alist '(haskell-mode . haskell))
  (add-to-list 'tree-sitter-major-mode-language-alist '(agda2-mode . agda)))

(setq jl/builtin-treesit '(sh-mode c++-mode c-mode csharp-mode css-mode java-mode js-mode js2-mode rjsx-mode json-mode python-mode typescript-mode))

(use-package tree-sitter-langs
  :defer t
  :after tree-sitter
  :config
  (progn
    (let* ((use-tree-sitter-langs  (mapcar 'car tree-sitter-major-mode-language-alist))
           (tree-sitter-mode-hooks  (mapcar #'(lambda (mode) (intern (concat (symbol-name mode) "-hook"))) (seq-difference use-tree-sitter-langs jl/builtin-treesit))))
      (mapc #'(lambda (hook) (add-hook hook 'tree-sitter-hl-mode)) tree-sitter-mode-hooks))))

(use-package evil-tree-edit
  :defer t
  :after tree-sitter)

(use-package tree-sitter-indent
  :defer t
  :after tree-sitter)

(use-package ts-fold
  :defer t
  :after tree-sitter
  :straight (ts-fold :type git :host github :repo "emacs-tree-sitter/ts-fold"))

(use-package treesit-auto
  :defer t
  :config
  (global-treesit-auto-mode))

;; `M-x combobulate' (default: `C-c o o') to start using Combobulate
(use-package treesit
  :straight nil
  :preface
  (defun mp-setup-install-grammars ()
    "Install Tree-sitter grammars if they are absent."
    (interactive)
    (dolist (grammar
             '((css "https://github.com/tree-sitter/tree-sitter-css")
               (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "master" "src"))
               (python "https://github.com/tree-sitter/tree-sitter-python")
               (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src"))
               (yaml "https://github.com/ikatyang/tree-sitter-yaml")))
      (add-to-list 'treesit-language-source-alist grammar)
      ;; Only install `grammar' if we don't already have it
      ;; installed. However, if you want to *update* a grammar then
      ;; this obviously prevents that from happening.
      (unless (treesit-language-available-p (car grammar))
        (treesit-install-language-grammar (car grammar)))))

  ;; Optional, but recommended. Tree-sitter enabled major modes are
  ;; distinct from their ordinary counterparts.
  ;;
  ;; You can remap major modes with `major-mode-remap-alist'. Note
  ;; that this does *not* extend to hooks! Make sure you migrate them
  ;; also
  (dolist (mapping '((python-mode . python-ts-mode)
                     (css-mode . css-ts-mode)
                     (typescript-mode . tsx-ts-mode)
                     (js-mode . js-ts-mode)
                     (css-mode . css-ts-mode)
                     (yaml-mode . yaml-ts-mode)))
    (add-to-list 'major-mode-remap-alist mapping))

  :config
  (mp-setup-install-grammars)
  ;; Do not forget to customize Combobulate to your liking:
  ;;
  ;;  M-x customize-group RET combobulate RET
  ;;
  (use-package combobulate
    :straight (:host github :repo "mickeynp/combobulate" :branch "master" :files ("*.el"))
    :general
    (jl/C-c-keys
      :keymaps 'combobulate-key-map
      :states '(normal visual operator)
      "o"  '(:ignore t :which-key "combobulate")
      "oe" '(:ignore t :which-key "envelope")
      "oh" '(:ignore t :which-key "highlight")
      "ot" '(:ignore t :which-key "edit")
      "ox" '(:ignore t :which-key "xref")
      "oB" '(:ignore t :which-key "Builder")

      )
    :preface
    ;; You can customize Combobulate's key prefix here.
    ;; Note that you may have to restart Emacs for this to take effect!
    (setq combobulate-key-prefix "C-c o")

    ;; Optional, but recommended.
    ;;
    ;; You can manually enable Combobulate with `M-x
    ;; combobulate-mode'.
    :hook ((python-ts-mode . combobulate-mode)
           (js-ts-mode . combobulate-mode)
           (css-ts-mode . combobulate-mode)
           (yaml-ts-mode . combobulate-mode)
           (typescript-ts-mode . combobulate-mode)
           (tsx-ts-mode . combobulate-mode))))
