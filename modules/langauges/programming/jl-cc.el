(use-package cc-mode
  :hook ((c-mode-common . electric-pair-local-mode)
         (c-mode-common . electric-indent-mode)))

(use-package clang-format
  :defer t
  :config
  (setq clang-format-style-option "llvm"))

(use-package gendoxy
  :defer t
  :straight (:host github :repo "mp81ss/gendoxy" :branch "master" :files ("*.el"))
  :general
 (jl/major-modes
   :keymaps '(c-mode-map c++-mode-map)
   :states '(normal visual operator)
   :major-modes t
   "d" '(:ignore t :which-key "doxygen")
   "dh" 'gendoxy-header
   "dt" 'gendoxy-tag
   "dT" 'gendoxy-tag-header
   "dg" 'gendoxy-group
   "dG" 'gendoxy-group-header
   "ds" 'gendoxy-group-start
   "de" 'gendoxy-group-end))

(use-package cmake-mode)
(use-package cpputils-cmake)
