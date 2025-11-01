(use-package corfu
  :straight (corfu :includes corfu-popupinfo
                   :files (:defaults "extensions/corfu-popupinfo.el"))
  :general
  (:keymaps 'corfu-map
            "TAB" 'corfu-next
            [tab] 'corfu-next
            "C-j" 'corfu-next
            "S-TAB" 'corfu-previous
            [backtab] 'corfu-previous
            "C-k" 'corfu-previous
            [escape] 'jl/corfu-quit
            )
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  (corfu-separator ?\s)          ;; Orderless field separator
  (corfu-quit-at-boundary t)     ;; Quit at completion boundary
  (corfu-quit-no-match t)        ;; Quit if there is no match
  (corfu-preview-current nil)    ;; Disable current candidate preview
  (corfu-preselect-first t)      ;; Enable candidate preselection
  (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  (corfu-echo-documentation nil) ;; Disable documentation in the echo area
  (corfu-scroll-margin 5)        ;; Use scroll margin
  (corfu-auto-delay 0.0)         ;; Don't wait to show corfu after
                                 ;; prefix has been hit
  (corfu-auto-prefix 1)
  ;; Works with `indent-for-tab-command'. Make sure tab doesn't indent when you
  ;; want to perform completion
  (tab-always-indent 'complete)

  ;; You may want to enable Corfu only for certain modes.
  :hook ((prog-mode . corfu-mode)
         (text-mode . corfu-mode)
         (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since dabbrev can be used globally (M-/).
  :init
  (defun jl/corfu-quit ()
    (interactive)
    (corfu-quit)
    (evil-normal-state))
  :config
  (global-corfu-mode)
  (corfu-popupinfo-mode)
  (setq text-mode-ispell-word-completion nil)
  (general-define-key :keymaps 'corfu-map
                      :states 'insert
                      [escape] 'jl/corfu-quit))

(use-package kind-icon
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))
