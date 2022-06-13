;;; jl-ipython-shell-send.el --- jl ipython-shell-send configuration -*- lexical-binding: t -*-

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

(use-package ipython-shell-send
  :general
  (jl/major-modes
    :keymaps 'python-mode-map
    :states '(normal visual operator)
    :major-modes t
    "'" 'run-python
    "sb" 'ipython-shell-send-buffer
    "sr" 'ipython-shell-send-region
    "sd" 'ipython-shell-send-defun))

(provide 'jl-ipython-shell-send)
;;; jl-ipython-shell-send.el ends here
