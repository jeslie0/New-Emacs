(use-package erc
  :commands (erc
 	     erc-tls)
  :straight nil
  ;; :hook (erc-mode . erc-image-mode)
  :general
  (jl/SPC-keys
    "ari" 'erc-tls)
  (:states '(normal insert visual)
           :keymaps 'erc-mode-map
           "C-j" 'erc-next-command
           "C-k" 'erc-previous-command
           "C-l" 'erc-clear-input-ring)
  :custom
  (erc-server "irc.libera.chat")
  (erc-nick "KanFibration")
  (erc-port "6697")
  ;; (erc-prompt-for-password nil)
  (erc-user-full-name "James Leslie")
  (erc-track-shorten-start 8)
  (erc-autojoin-channels-alist '(("irc.libera.chat"
				  "#systemcrafters"
				  "#emacs"
				  "##math"
				  "#categorytheory"
				  "#haskell"
				  "#nyxt"
				  "#nixos")))
  (erc-kill-buffer-on-part t)
  (erc-auto-query 'bury)
  :init
  (setq erc-autojoin-channels-alist
        '(("irc.libera.chat"
	   "#systemcrafters"
	   "#emacs"
	   "##math"
	   "#categorytheory"
	   "#haskell"
	   "#nyxt"
	   "#nixos"))))

(use-package erc-hl-nicks
  :defer t
  :after (erc)
  :hook (erc-mode . erc-hl-nicks-mode))
