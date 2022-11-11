(use-package highlight-indent-guides
  :defer t
  :hook (((prog-mode LaTeX-mode) . highlight-indent-guides-mode)
         (after-load-theme-hook . (lambda () (highlight-indent-guides-auto-set-faces))))
  :custom
  (highlight-indent-guides-method 'bitmap)
  (highlight-indent-guides-bitmap-function #'highlight-indent-guides--bitmap-line))
