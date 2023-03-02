(use-package python-mode
  :defer t
  :custom
  (python-shell-interpreter "ipython")
  (python-shell-interpreter-args "-i --simple-prompt --InteractiveShell.display_page=True")
  :init
  (add-to-list 'auto-mode-alist `("\\.py\\'" . ,(if (treesit-available-p) 'python-ts-mode 'python-mode)))
  :config
  (defun lspython ()
    "Updates the lsp-python-ms-executable variable and runs lsp."
    (interactive)
    (setq lsp-python-ms-executable (executable-find "python-language-server"))
    (lsp-deferred)))

(use-package lsp-python-ms
  :defer t
  :hook (python-mode . (lambda ()
                         (require 'lsp-python-ms))))

(use-package ipython-shell-send
  :general
  (jl/major-modes
    :keymaps '(python-mode-map python-ts-mode-map)
    :states '(normal visual operator)
    :major-modes t
    "'" 'run-python
    "sb" 'ipython-shell-send-buffer
    "sr" 'ipython-shell-send-region
    "sd" 'ipython-shell-send-defun))

(use-package blacken
  :defer t
  :hook (python-mode . blacken-mode))

(use-package ob-ipython
  :defer t)
