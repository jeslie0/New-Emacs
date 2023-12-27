(defun jl/auctex-keys ()
  (jl/major-modes
    :keymaps 'latex-mode-map
    :states '(normal visual motion)
    :major-modes t
    "xf" '(:ignore t :which-key "fonts")
    "f" '(:ignore t :which-key "fill")
    "h" '(:ignore t :which-key "help")
    "x" '(:ignore t :which-key "text/fonts")
    "z" '(:ignore t :which-key "fold")
    "i" '(:ignore t :which-key "insert")
    "p" '(:ignore t :which-key "preview")
    "r" '(:ignore t :which-key "reftex"))

  (jl/major-modes
    :keymaps 'LaTeX-mode-map
    :states '(normal visual motion)
    :major-modes t

    "\\"  'TeX-insert-macro                   ;; C-c C-m
    "-"   'TeX-recenter-output-buffer         ;; C-c C-l
    "%"   'TeX-comment-or-uncomment-paragraph ;; C-c %
    ";"   'comment-or-uncomment-region        ;; C-c ; or C-c :
    ;; TeX-command-run-all runs compile and open the viewer
    "k"   'TeX-kill-job               ;; C-c C-k
    "l"   'TeX-recenter-output-buffer ;; C-c C-l
    "m"   'TeX-insert-macro           ;; C-c C-m
    "n"   'TeX-next-error             ;; C-c `
    "N"   'TeX-previous-error         ;; M-g p
    "v"   'TeX-view                   ;; C-c C-v
    ;; TeX-doc is a very slow function
    "hd"  'TeX-doc
    "xb"  'latex/font-bold
    "xc"  'latex/font-code
    "xe"  'latex/font-emphasis
    "xi"  'latex/font-italic
    "xr"  'latex/font-clear
    "xo"  'latex/font-oblique
    "xfc" 'latex/font-small-caps
    "xff" 'latex/font-sans-serif
    "xfr" 'latex/font-serif

    "a"   'TeX-command-run-all ;; C-c C-a
    "c"   'TeX-command-master
    "z=" 'TeX-fold-math
    "zb" 'TeX-fold-buffer
    "zB" 'TeX-fold-clearout-buffer
    "ze" 'TeX-fold-env
    "zI" 'TeX-fold-clearout-item
    "zm" 'TeX-fold-macro
    "zp" 'TeX-fold-paragraph
    "zP" 'TeX-fold-clearout-paragraph
    "zr" 'TeX-fold-region
    "zR" 'TeX-fold-clearout-region
    "zz" 'TeX-fold-dwim

    "*"   'LaTeX-mark-section     ;; C-c *
    "."   'LaTeX-mark-environment ;; C-c .
    "ii"   'LaTeX-insert-item     ;; C-c C-j
    "s"   'LaTeX-section          ;; C-c C-s
    "fe"  'LaTeX-fill-environment ;; C-c C-q C-e
    "fp"  'LaTeX-fill-paragraph   ;; C-c C-q C-p
    "fr"  'LaTeX-fill-region      ;; C-c C-q C-r
    "fs"  'LaTeX-fill-section     ;; C-c C-q C-s
    "pb"  'preview-buffer
    "pc"  'preview-clearout
    "pd"  'preview-document
    "pe"  'preview-environment
    "pf"  'preview-cache-preamble
    "pp"  'preview-at-point
    "pr"  'preview-region
    "ps"  'preview-section
    "xB"  'latex/font-medium
    "xr"  'latex/font-clear
    "xfa" 'latex/font-calligraphic
    "xfn" 'latex/font-normal
    "xfu" 'latex/font-upright

    "a"   'TeX-command-run-all
    "iC"   'org-ref-insert-cite-key
    "ic"   'LaTeX-close-environment
    "ie"   'LaTeX-environment

    "rc" 'reftex-citation
    "rg" 'reftex-grep-document
    "ri" 'reftex-index-selection-or-word
    "rI" 'reftex-display-index
    "rl" 'reftex-label
    "rp" 'reftex-index-phrase-selection-or-word
    "rr" 'reftex-reference
    "rs" 'reftex-search-document
    "rt" 'reftex-toc
    "rT" 'reftex-toc-recenter
    "rv" 'reftex-view-crossref))

(use-package tex
  :straight auctex
  :hook ((LaTeX-mode . outline-minor-mode)
         (LaTeX-mode . visual-line-mode)
         (LaTeX-mode . TeX-fold-mode)
         (LaTeX-mode . LaTeX-math-mode)
         (LaTeX-mode . TeX-source-correlate-mode)
         (LaTeX-mode . TeX-PDF-mode)
         (LaTeX-mode . display-line-numbers-mode)
         (LaTeX-mode . smartparens-mode)
         (LaTeX-mode . (lambda () (turn-on-reftex)))
         (LaTeX-mode . (lambda () (LaTeX-add-environments
                                   '("theorem")
                                   '("proof")
                                   '("lemma")
                                   '("proposition")
                                   '("corollary")
                                   '("example")
                                   '("tcolorbox")
                                   '("tikzcd")
                                   '("definition")
                                   '("align*")))))
  :init
  (jl/auctex-keys)
  (setq TeX-parse-self t     ;; Enable Parse on load
        TeX-auto-save t      ;; Enable Parse on save
        TeX-master nil
        TeX-engine 'luatex   ;; Default to compiling with luqlatex
        TeX-electric-sub-and-superscript t  ;; Insert braces after ^ or _
        TeX-electric-math '("\\(" . "\\)")  ;; Use \( \) as the dollar
        LaTeX-electric-left-right-brace t   ;; Close brackets sensibly
        TeX-view-program-selection '((output-pdf "Zathura"))
        TeX-source-correlate-start-server t)

  (setq texmathp-tex-commands '(("tikzcd" 'env-on))) ;; Custom math envs
  (setq reftex-plug-into-AUCTeX t
        reftex-default-bibliography '("~/texmf/bibtex/bib/bibliography.bib")
        reftex-label-alist '(("theorem" ?h "thm:" "~\\ref{%s}" t   ("theorem" "th.") -3)
                             ("proof"   ?g "pf:"  "~\\ref{%s}" t   ("proof" "pf.") -3)
                             ("lemma"   ?l "lem:" "~\\ref{%s}" nil ("lemma"   "le.") -2)
                             ("proposition" ?p "prp:" "~\\ref{%s}" t   ("proposition" "pr.") -3)
                             ("corollary" ?c "cor:" "~\\ref{%s}" t   ("corollary" "co.") -3)
                             ("example" ?a "ex:" "~\\ref{%s}" t   ("example" "ex.") -3)
                             ("tcolorbox" ?b  "tcb:" "~\\ref{%s}" t   ("tcolorbox" "cb.") -3)
                             ("tikzcd" ?j "cd:" "~\\ref{%s}" t  ("tikzcd" "cd.") -3)
                             ("definition" ?d "def:" "~\\ref{%s}" t   ("definition" "de.") -3)))

  :config
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
  ;; Folding environments
  (defun latex-fold-env-all ()
    (interactive)
    (let ((env (read-from-minibuffer "Fold Environment: ")))
      (save-excursion
	    (goto-char (point-min))
	    (while (search-forward (format "begin{%s}" env) nil t)
	      (TeX-fold-env))))))

  ;;; Functions

;; Rebindings for TeX-font
(defun latex/font-bold () (interactive) (TeX-font nil ?\C-b))
(defun latex/font-medium () (interactive) (TeX-font nil ?\C-m))
(defun latex/font-code () (interactive) (TeX-font nil ?\C-t))
(defun latex/font-emphasis () (interactive) (TeX-font nil ?\C-e))
(defun latex/font-italic () (interactive) (TeX-font nil ?\C-i))
(defun latex/font-clear () (interactive) (TeX-font nil ?\C-d))
(defun latex/font-calligraphic () (interactive) (TeX-font nil ?\C-a))
(defun latex/font-small-caps () (interactive) (TeX-font nil ?\C-c))
(defun latex/font-sans-serif () (interactive) (TeX-font nil ?\C-f))
(defun latex/font-normal () (interactive) (TeX-font nil ?\C-n))
(defun latex/font-serif () (interactive) (TeX-font nil ?\C-r))
(defun latex/font-oblique () (interactive) (TeX-font nil ?\C-s))
(defun latex/font-upright () (interactive) (TeX-font nil ?\C-u))

(use-package auctex-latexmk
  :after tex
  :straight (:host github :repo "emacsmirror/auctex-latexmk" :branch "master" :files ("auctex-latexmk.el"))
  :config
  (auctex-latexmk-setup))


(use-package lsp-latex
  :defer t)

(use-package latex-change-env
  :defer t
  :general
  (jl/major-modes
    :keymaps 'LaTeX-mode-map
    :states '(normal visual motion)
    :major-modes t
    "C" #'latex-change-env))
