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
    "f" 'nix-mode-format
    "i" 'nix-indent-line
    "r" 'nix-indent-region
    "F" 'nix-format-buffer)
  (jl/SPC-keys
    :states '(normal visual motion)
    "n"    '(:ignore t :which-key "nix")

    "nc"   'nix-compile
    "nC"   'nix-clear-caches)
  :mode "\\.nix\\'")

(use-package nix-shell
  :straight nix-mode
  :general
  (jl/SPC-keys
    "ns"  '(:ignore t :which-key "shell")
    "nss" 'nix-shell
    "nse" 'nix-eshell
    "nsu" 'nix-shell-unpack
    "nsb" 'nix-shell-build
    "nsc" 'nix-shell-configure))

(use-package nix-search
  :straight nix-mode
  :general
  (jl/SPC-keys
    "nS" 'nix-search))

(use-package nix-repl
  :straight nix-mode
  :general
  (jl/SPC-keys
   "nr" 'nix-repl))

(use-package nix-flake
  :straight nix-mode
  :general
  (jl/SPC-keys
    "nf" '(:ignore t :which-key "flakes")
    "nfi"  '(:ignore t :which-key "init")

    "nf."  'nix-flake-dispatch
    "nff"  'nix-flake
    "nfr"  'nix-flake-run-attribute
    "nfR"  'nix-flake-run-default

    "nfii" 'nix-flake-init
    "nfiI" 'nix-flake-init-dispatch
    "nfir" 'nix-flake-init:from-registry
    "nfit" 'nix-flake-init-select-template
    "nfid" 'nix-flake-init:default-templates

    "nfl"  'nix-flake-lock
    "nfc"  'nix-flake-check
    "nfu"  'nix-flake-update
    "nfB"  'nix-flake-build-default
    "nfb"  'nix-flake-build-attribute))

(use-package nix-store
  :straight nix-mode
  :general
  (jl/SPC-keys
    "nS"  '(:ignore t :which-key "Store")
    "nSp" 'nix-store-show-path
    "nSP" 'nix-store-path-at-point))

(use-package nix-drv-mode
  :straight nix-mode
  :mode "\\.drv\\'")
