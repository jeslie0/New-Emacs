;;; jl-erc.el --- jl erc configuration -*- lexical-binding: t -*-

;; Author: James Leslie <jamesleslie@posteo.net>
;; Created: 13-06-2022


;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:

;; commentary

;;; Code:

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

(provide 'jl-erc)
;;; jl-erc.el ends here
