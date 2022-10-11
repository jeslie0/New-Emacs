(use-package pdf-tools
  :straight nil
  :mode (("\\.pdf\\'" . pdf-view-mode))
  :config
  (progn
    (mapcar
     #'(lambda (filename) (load (concat pdf-tools-directory filename)))
     (-filter (lambda (filename)
                (and (f-ext-p filename "elc") (not (equal filename "pdf-tools.elc"))))
              (cdr (cdr (cdr (directory-files pdf-tools-directory)))))))
  (jl/major-modes
    :keymaps 'pdf-view-mode-map
    :states '(normal visual operator)
    :major-modes t
    "a" '(:ignore t :which-key "annotations")
    "t" '(:ignore t :which-key "toggle")

    "aa" #'pdf-annot-attachment-dired
    "ah" #'pdf-annot-add-highlight-markup-annotation
    "al" #'pdf-annot-list-annotations
    "am" #'pdf-annot-add-markup-annotation
    "ao" #'pdf-annot-add-strikeout-markup-annotation
    "as" #'pdf-annot-add-squiggly-markup-annotation
    "at" #'pdf-annot-add-text-annotation
    "au" #'pdf-annot-add-underline-markup-annotation
    "aD" #'pdf-annot-delete

    "td" #'pdf-view-dark-minor-mode
    "tm" #'pdf-view-midnight-minor-mode
    "tp" #'pdf-view-printer-minor-mode
    "tt" #'pdf-view-themed-minor-mode

    "p" #'pdf-view-extract-region-image
    "P" #'pdf-misc-print-document

    "TAB" #'pdf-outline
    "s" #'pdf-occur)
  (setq pdf-view-use-scaling t)
  (pdf-tools-install))
