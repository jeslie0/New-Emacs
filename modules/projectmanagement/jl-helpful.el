(use-package helpful
  ;; :after ivy
  ;; :after vertico
  :general
  (jl/SPC-keys
    "h" '(:ignore t :which-key "help")
    "hT" '(:ignore t :which-key "Tutorials")

    "hi" 'info
    "hf" 'describe-function
    "hv" 'describe-variable
    "hm" 'describe-mode
    "hb" 'describe-bindings
    "hk" 'describe-key
    "hs" 'describe-symbol

    "hTe" 'help-with-tutorial
    "hM" 'view-echo-area-messages)
  ;; :custom
  ;; (counsel-describe-function-function #'helpful-callable)
  ;; (counsel-describe-variable-function #'helpful-variable)
  :bind
  ;; ([remap describe-function] . counsel-describe-function)
  ([remap describe-function] . helpful-function)
  ([remap describe-command]  . helpful-command)
  ;; ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key]      . helpful-key)
  :init
  (defvar read-symbol-positions-list nil))
