;;; jl-whichkey.el --- jl which-key configuration -*- lexical-binding: t -*-

;; Author: James Leslie <jamesleslie@posteo.net>
;; Created: 12/06/2022


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

(use-package which-key
  :after
  (evil)
  :config
  (which-key-mode)
  :diminish which-key-mode
  :custom
  (which-key-idle-delay 0.4)
  (which-key-idle-secondary-delay 0.01)
  (which-key-sort-order 'which-key-prefix-then-key-order)
  (which-key-sort-uppercase-first nil)
  (which-key-min-display-lines 6)
  (which-key-max-description-length 32)
  (which-key-add-column-padding 1)
  (which-key-allow-multiple-replacements t))

(provide 'jl-whichkey)
;;; jl-whichkey.el ends here
