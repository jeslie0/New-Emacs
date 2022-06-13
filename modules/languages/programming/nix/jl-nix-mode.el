;;; jl-nix-mode.el --- jl nix-mode configuration -*- lexical-binding: t -*-

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

(defun find-nixos-configuration ()
  "Edit the `dotfile', in the current window."
  (interactive)
  (find-file-existing "/etc/nixos/configuration.nix"))

(defun find-homemanager-configuration ()
  "Edit the `dotfile', in the current window."
  (interactive)
  (find-file-existing "~/.config/nixpkgs/home.nix"))

(use-package nix-mode
  :general
  (jl/major-modes
    :keymaps 'nix-mode-map
    :states '(normal visual motion)
    :major-modes t
    "=" 'nix-format-buffer)
  (jl/SPC-keys
    :states '(normal visual motion)
    "n"    '(:ignore t :which-key "nix")
    "nf"   '(:ignore t :which-key "flakes")
    "nfi"  '(:ignore t :which-key "init")
    "nf."  'nix-flake-dispatch
    "nff"  'nix-flake
    "nfr"  'nix-flake-run-default
    "nfR"  'nix-flake-run-attribute

    "nfii" 'nix-flake-init
    "nfiI" 'nix-flake-init-dispatch
    "nfir" 'nix-flake-init:from-registry
    "nfit" 'nix-flake-init-select-template
    "nfid" 'nix-flake-init:default-templates

    "nfl"  'nix-flake-lock
    "nfc"  'nix-flake-check
    "nfu"  'nix-flake-update
    "nfb"  'nix-flake-build-default
    "nfB"  'nix-flake-build-attribute

    "nr"   'nix-repl
    "ns"   'nix-shell
    "ne"   'nix-eshell
    "nS"   'nix-search
    "nc"   'nix-compile
    "ng"   'nix-shell-build
    "nC"   'nix-clear-caches
    "nu"   'nix-shell-unpack
    "nU"   'nix-shell-configure)
  :mode "\\.nix\\'")



(provide 'jl-nix-mode)
;;; jl-nix-mode.el ends here
