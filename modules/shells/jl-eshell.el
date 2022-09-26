(defun efs/configure-eshell ()
  ;; Save command history when commands are entered
  (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)

  ;; Truncate buffer for performance
  (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

  ;; Bind some useful keys for evil-mode
  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "C-r") 'counsel-esh-history)
  (evil-define-key '(normal insert visual) eshell-mode-map (kbd "<home>") 'eshell-bol)
  (evil-normalize-keymaps)

  (setq
   eshell-history-size         10000
   eshell-buffer-maximum-lines 10000
   eshell-hist-ignoredups t
   eshell-scroll-to-bottom-on-input t))

(use-package eshell-git-prompt
  :defer t)


(use-package eshell
  :commands (eshell)
  :defer t
  :hook (eshell-first-time-mode . efs/configure-eshell)
  :general
  (jl/SPC-keys
    "ase" 'eshell)
  (:keymaps 'eshell-mode-map
            "C-j" 'eshell-next-matching-input-from-input
            "C-k" 'eshell-previous-matching-input-from-input)
  :config
  (defalias 'eshell/d 'dired)

  (with-eval-after-load 'esh-opt
    (setq eshell-destroy-buffer-when-process-dies t)
    (setq eshell-visual-commands '("htop" "zsh" "vim" "nmtui")))

  (eshell-git-prompt-use-theme 'powerline))

(use-package eshell-did-you-mean
  :straight (:host github :repo "xuchunyang/eshell-did-you-mean" :branch "master" :files ("*.el"))
  :after eshell
  :config
  (eshell-did-you-mean-setup))

(use-package esh-help
  :after eshell
  :hook (eshell-mode . eldoc-mode)
  :config
  (setup-esh-help-eldoc))

(use-package eshell-syntax-highlighting
  :after eshell
  :config
  (eshell-syntax-highlighting-global-mode +1))

(use-package fish-completion
  :hook (eshell-mode . fish-completion-mode)
  :custom
  (fish-completion-fallback-on-bash-p t)
  :after eshell
  :config
  (global-fish-completion-mode))
