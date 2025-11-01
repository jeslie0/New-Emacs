(use-package agda2-mode
  :straight nil
  :defer t
  :general
  (jl/major-modes
    :states '(normal visual operator)
    :keymaps 'agda2-mode-map
    "g"   '(:ignore t :which-key "goto")
    "n"   '(:ignore t :which-key "normalise")
    "x"   '(:ignore t :which-key "options")

    "?"   'agda2-show-goals
    "."   'agda2-goal-and-context-and-inferred
    ","   'agda2-goal-and-context
    ";"   'agda2-goal-and-context-and-checked
    "="   'agda2-show-constraints
    "SPC" 'agda2-give
    "RET" 'agda2-elaborate-give
    "a"   'agda2-auto-maybe-all
    "b"   'agda2-previous-goal-transient
    "c"   'agda2-make-case
    "d"   'agda2-infer-type-maybe-toplevel
    "e"   'agda2-show-context
    "f"   'agda2-next-goal-transient

    "gG"  'agda2-go-back
    "h"   'agda2-helper-function-type
    "l"   'agda2-load
    "n"   'agda2-compute-normalised-maybe-toplevel
    "o"   'agda2-module-contents-maybe-toplevel
    "r"   'agda2-refine
    "s"   'agda2-solve-maybe-all
    "t"   'agda2-goal-type

    "un"  'agda2-compute-normalised
    "uN"  'agda2-compute-normalised-toplevel

    "w"   'agda2-why-in-scope-maybe-toplevel

    "xa"  'agda2-abort
    "xc"  'agda2-compile
    "xd"  'agda2-remove-annotations
    "xh"  'agda2-display-implicit-arguments
    "xl"  'agda2-load
    "xq"  'agda2-quit
    "xr"  'agda2-restart
    "xs"  'agda2-set-program-version
    "x;"  'agda2-comment-dwim-rest-of-buffer

    "z"   'agda2-search-about-toplevel)
  :init
  (progn
    (load-file (let ((coding-system-for-read 'utf-8))
                 (shell-command-to-string "agda --emacs-mode locate"))))
  :config
  (set-input-method "Agda")
  (defhydra jl/agda-goal-navigation (:hint nil)
    "
^Next Goal^    ^Previous Goal
^^^--------------------------
[_f_]          [_b_]
"
    ("f" agda2-next-goal)
    ("b" agda2-previous-goal)
    ("q" nil "quit" :exit t))

  (defun agda2-next-goal-transient ()
    (interactive)
    (jl/agda-goal-navigation/body)
    (agda2-next-goal))

  (defun agda2-previous-goal-transient ()
    (interactive)
    (jl/agda-goal-navigation/body)
    (agda2-previous-goal)))
