(use-package vc
  :defer t
  :general
  (jl/SPC-keys
    :prefix-map 'vc-prefix-map
    :prefix "SPC g v")
  ;; Doesn't work
  ;; (jl/major-modes
  ;;   :keymap 'log-edit-mode-map
  ;;   :states '(normal visual operator)
  ;;   :major-modes t
  ;;   "," #'log-edit-done
  ;;   "a" #'log-edit-kill-buffer)
  (jl/SPC-keys
    "gv" '(:ignore t :which-key "VC")
    "gvM" '(:ignore t :which-key "Mergebase")))
