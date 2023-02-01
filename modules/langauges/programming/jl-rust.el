(use-package cargo
  :defer t
  :general
  (jl/major-modes
    :keymaps 'rust-mode-map
    :states '(normal visual operator)
    :major-modes t
    "c" '(:ignore t :which-key "cargo")
    "c." 'cargo-process-repeat
    "c/" 'cargo-process-search
    "c=" 'cargo-process-fmt
    "ca" 'cargo-process-add
    "cA" 'cargo-process-audit
    "cc" 'cargo-process-build
    "cC" 'cargo-process-clean
    "cd" 'cargo-process-doc
    "cD" 'cargo-process-doc-open
    "ce" 'cargo-process-bench
    "cE" 'cargo-process-run-example
    "ci" 'cargo-process-init
    "cl" 'cargo-process-clippy
    "cn" 'cargo-process-new
    "co" 'cargo-process-outdated
    "cr" 'cargo-process-rm
    "cu" 'cargo-process-update
    "cU" 'cargo-process-upgrade
    "cv" 'cargo-process-check
    "cx" 'cargo-process-run
    "cX" 'cargo-process-run-bin

    "t" '(:ignore t :which-key "test")
    "ta" 'cargo-process-test
    "tt" 'cargo-process-current-test
    "tb" 'cargo-process-current-file-tests))

(use-package rust-mode
  :defer t
  :general
 (jl/major-modes
   :keymaps 'rust-mode-map
   :states '(normal visual operator)
   :major-modes t
   "=" 'rust-format-buffer))
