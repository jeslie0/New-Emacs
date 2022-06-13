;;; jl-counsel.el --- jl counsel configuration -*- lexical-binding: t -*-

;; Author: James Leslie <jamesleslie@posteo.net>
;; Created: 13-06-2022


;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:

;; commentary

;;; Code:

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-f" . 'counsel-minibuffer-history))
  :init
  (counsel-mode 1)
  (jl/SPC-keys
  "SPC" '(counsel-M-x :which-key "M-x")
  "ff" '(counsel-find-file :which-key "find file")
  "tt" '(counsel-load-theme :which-key "choose theme")
  "bb" '(persp-counsel-switch-buffer :which-key "show local buffers")
  "bB" '(counsel-ibuffer :which-key "show all buffers") ;; DON'T USE THIS, USE C-u SPC b b
  "/" 'counsel-rg))

(provide 'jl-counsel)
;;; jl-counsel.el ends here
