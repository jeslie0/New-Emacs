;;; jl-eshell.el --- jl eshell configuration -*- lexical-binding: t -*-

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

(provide 'jl-eshell)
;;; jl-eshell.el ends here
