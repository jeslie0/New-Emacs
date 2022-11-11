(use-package corfu-doc
  :after corfu
  :hook (corfu-mode . corfu-doc-mode)
  :general (:keymaps 'corfu-map
                     "M-n" #'corfu-doc-scroll-up
                     "M-p" #'corfu-doc-scroll-down
                     "M-h" #'corfu-doc-toggle)
  :custom
  (corfu-doc-auto nil)
  (corfu-doc-delay 0.1)
  (corfu-doc-max-width 70)
  (corfu-doc-max-height 20)

  ;; NOTE 2022-02-05: I've also set this in the `corfu' use-package to be
  ;; extra-safe that this is set when corfu-doc is loaded. I do not want
  ;; documentation shown in both the echo area and in the `corfu-doc' popup.
  (corfu-echo-documentation nil))
