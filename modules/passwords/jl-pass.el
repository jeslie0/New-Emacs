(defun spacemacs//pass-completing-read ()
"Read a password entry in the minibuffer, with completion."
(completing-read "Password entry: " (password-store-list)))

(defun spacemacs/pass-copy-and-describe (entry)
  "Copy the password to the clipboard, and show the multiline description for ENTRY"
  (interactive (list (spacemacs//pass-completing-read)))
  (password-store-copy entry)
  (spacemacs/pass-describe entry))

(defun spacemacs/pass-describe (entry)
  "Show the multiline description for ENTRY"
  (interactive (list (spacemacs//pass-completing-read)))
  (let ((description (s-join "\n" (cdr (s-lines (password-store--run-show entry))))))
    (message "%s" description)))
(use-package password-store
  :general
  (jl/SPC-keys
    "apy" 'password-store-copy
    "apg" 'password-store-generate
    "api" 'password-store-insert
    "apc" 'password-store-edit
    "apr" 'password-store-rename
    "apd" 'password-store-remove
    "apD" 'password-store-clear
    "apI" 'password-store-init
    "apw" 'password-store-url)
  (jl/SPC-keys
    "ap" '(:ignore t :which-key "pass")))

(use-package password-store-otp
  :defer t
  :general
  (jl/SPC-keys
    "apoy" 'password-store-otp-token-copy
    "apoY" 'password-store-otp-uri-copy
    "apoi" 'password-store-otp-insert
    "apoa" 'password-store-otp-append
    "apoA" 'password-store-otp-append-from-image)
  (jl/SPC-keys
    "apo" '(:ignore t :which-key "otp")))

(use-package auth-source-pass
  :config
  (auth-source-pass-enable))
