;;; jl-hydra.el --- jl hydra configuration -*- lexical-binding: t -*-

;; Author: James Leslie <jamesleslie@posteo.net>
;; Created: 12/06/22


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

(use-package hydra
  :defer t
  :init
  (defhydra hydra-text-scale (:hint nil) ;;(:timeout 4) ;; -- I don't want a timeout
    "
^Increase^    ^Decrease^    ^Reset
^^^^^------------------------------
[_+_]         [_-_]         [_0_]
[_k_]         [_j_]         ^
"
    ("k" text-scale-increase)
    ("+" text-scale-increase)

    ("j" text-scale-decrease)
    ("-" text-scale-decrease)

    ("0" (text-scale-adjust 0))
    ("f" nil "finished" :exit t))

  (defhydra jl/pasting-hydra ()
    "Pasting Transient State"
    ("C-j" evil-paste-pop)
    ("C-k" evil-paste-pop-next)
    ("p" evil-paste-after)
    ("P" evil-paste-before))

  (general-define-key
   :states 'normal
   "p"  'jl/pasting-hydra/evil-paste-after))

(provide 'jl-hydra)
;;; jl-hydra.el ends here
