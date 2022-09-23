(use-package eldoc
  :defer t
  :commands (eldoc)
  :custom
  (eldoc-echo-area-prefer-doc-buffer t)
  (eldoc-idle-delay 0.5)
  (eldoc-echo-area-use-multiline-p nil))

(use-package eldoc-box
  :commands eldoc-box-eglot-help-at-point
  :config
  (set-face-attribute 'eldoc-box-body nil :background (face-background 'solaire-default-face)))
