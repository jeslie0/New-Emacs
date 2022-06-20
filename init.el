;;; init.el --- NewEmacsConfig -*- lexical-binding: t -*-

;; Author: James Leslie <jamesleslie@posteo.net>
;; Maintainer: James Leslie
;; Version: 0.0.0
;; Homepage: TODO coming
;; Creation: 12/06/2022


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

;; The init file for the user to edit.

;;; Code:

;;; Misc

(setq warning-suppress-types '((comp) (org-roam) (org-element-cache) ()(:warning)))


(defun jl/modules (modules)
  "Load MODULES."
  (mapc #'(lambda (module) (require module)) modules))




(setq default-directory (expand-file-name "modules/" user-emacs-directory))
(normal-top-level-add-subdirs-to-load-path)

(setq default-directory "/home/james/Documents/")
(setq dired-guess-shell-alist-user '(("\\.pdf\\'" "zathura")))
(setq read-process-output-max (* 1024 1024))
(setq-default indent-tabs-mode nil)
(setq vc-follow-symlinks t)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)


(jl/modules
 '(
   jl-gcmh
   jl-cleaning

   ;; ;;; Keybindings
   jl-evil
   jl-evil-collection
   jl-evil-commentary
   jl-evil-escape
   jl-evil-surround
   jl-general
   jl-hydra
   jl-whichkey

   ;;; Completion Framework
   ;;;; Vertico
   jl-vertico
   jl-embark
   jl-embark-consult
   jl-marginalia
   jl-consult
   jl-orderless
   jl-savehist
   jl-applauncher
   jl-all-the-icons-completion

   ;;;; Ivy
   ;; jl-ivy
   ;; jl-counsel
   ;; jl-all-the-icons-rich
   ;; jl-ivy-rich
   ;; jl-ivy-prescient

   ;;; Project Management
   jl-helpful
   jl-projectile
   jl-consult-projectile
   jl-eldoc
   jl-eldoc-box
   jl-magit

   ;;; UI
   jl-all-the-icons
   jl-dashboard
   jl-solaire
   jl-themes
   jl-winum
   jl-doom-modeline
   jl-perspective



  ;;;; Treemacs
   jl-treemacs
   jl-treemacs-all-the-icons
   jl-treemacs-evil
   jl-treemacs-icons-dired
   jl-treemacs-magit
   jl-treemacs-perspective
   ;; jl-treemacs-persp
   jl-treemacs-projectile

   ;;; Minor modes
   jl-rainbow-delimiters
   jl-outshine
   jl-aggressive-indent
   jl-golden-ratio
   jl-highlight-indent-guides
   jl-page-break-lines
   jl-smartparens
   jl-saveplace
   jl-variable-pitch
   jl-visual-line-mode
   jl-hl-todo
   jl-visual-fill-column

   ;;; Passwords
   ;; jl-ivy-pass
   jl-password-store
   jl-password-store-otp
   jl-auth-source-pass

   ;;; Languages
   ;;;; Tools
   jl-lsp
   jl-lsp-ui
   jl-lsp-treemacs
   ;; jl-lsp-ivy

   jl-eglot

   ;;;; Proof Assistants
   jl-agda
   jl-coq

   ;;;; Programming
   ;;;;; C/C++
   jl-c-cpp
   jl-clang-format
   jl-gendoxy
   jl-rtags

   ;;;;; C#
  jl-csharp
  jl-omnisharp
  jl-tree-sitter
  jl-tree-sitter-langs
  jl-tree-sitter-indent

  ;;;;; Elm
  jl-elm

  ;;;;; Haskell
  jl-haskell
  jl-lsp-haskell
  jl-hindent
  jl-hlint-refactor

  ;;;;; Lisps
  jl-slime
  ;; jl-evil-lisp-state
  jl-evil-cleverparens
  jl-elisp
  jl-ielm
  jl-edebug

  ;;;;; Shell
  jl-sh-script
  jl-shfmt
  ;; jl-insert-shebang

  ;;;;; Nix
  jl-nix-mode
  jl-nixos-options
  jl-nix-sandbox

  ;;;;; Java
  jl-lsp-java

  ;;;;; Python
  jl-lsp-python-ms
  jl-python-mode
  jl-ipython-shell-send
  jl-blacken

  ;;;; Text
  ;;;;; Org
  jl-org
  jl-org-fragtog
  jl-org-superstar
  jl-org-babel
  jl-ob-async
  jl-evil-org

  ;; jl-org-caldav

  jl-org-present
  jl-org-toc
  jl-ox-publish
  jl-ox-extra
  jl-engrave-faces
  jl-org-link

  jl-org-ref
  jl-org-ref-arxiv
  ;; jl-org-ref-ivy

  jl-org-roam
  jl-org-roam-ui
  jl-org-roam-bibtex
  jl-org-roam-protocol

  ;;;;; LaTeX
  jl-latex
  jl-auctex-latexmk
  jl-lsp-latex

  jl-ivy-bibtex

   ;;;; Other
  jl-yaml-mode

  ;;; Readers
  jl-elfeed
  ;; jl-elfeed-goodies
  jl-elfeed-score

  jl-elpher

  jl-erc
  jl-erc-hl-nicks
  ;; jl-erc-image

  jl-ement
  jl-mu4e
  jl-mu4e-thread-folding
  ;; jl-mu4e-alert
  jl-org-mime

  ;;; Yasnippets
  jl-yasnippet
  jl-consult-yasnippet
  jl-yasnippet-snippets
  jl-haskell-snippets
  jl-yatemplate
  ;; jl-ivy-yasnippet


  ;;; Autocomplete
  ;;;; Company
  ;; jl-company
  ;; jl-company-prescient
  ;; jl-company-shell

  ;;;; Corfu
  jl-corfu
  jl-kind-icon
  ;; jl-corfu-doc
  jl-cape

  ;;; Checkers
  jl-flycheck
  ;; jl-flyspell
  jl-ispell
  jl-flyspell-correct
  jl-spell-fu

  ;;; Tools
  jl-undo-tree
  jl-pandoc
  jl-iedit
  jl-wgrep
  jl-simple-httpd
  jl-define-word
  jl-floobits
  jl-edit-server
  jl-esup
  jl-openwith

  ;;; Shells
  jl-term
  jl-eterm-256color
  jl-vterm
  jl-eshell
  jl-eshell-git-prompt
  jl-eshell-did-you-mean
  jl-esh-help
  jl-eshell-syntax-highlighting
  jl-fish-completion

  ;;; Fun
  jl-snow
  jl-fireplace

  ;;; Direnv
  ;; jl-direnv
  jl-envrc


  ;;; Navigation
  jl-avy
   ))

(jl/load-theme 'doom-palenight)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("47db50ff66e35d3a440485357fb6acb767c100e135ccdf459060407f8baea7b2" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
