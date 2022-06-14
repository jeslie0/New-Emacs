;;; jl-avy.el --- jl avy configuration -*- lexical-binding: t -*-

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

(use-package avy
  :custom
  (avy-background t)
  :commands
  (avy-pop-mark
   evil-avy-goto-char-timer
   evil-avy-goto-line
   evil-avy-goto-word-or-subword-1
   avy-goto-url
   avy-open-url)
  :general
  (:states '(normal visual motion)
           "f" 'evil-avy-goto-char-timer)
  (jl/SPC-keys
    "jb" 'avy-pop-mark
    "jj" 'evil-avy-goto-char-timer
    "jl" 'evil-avy-goto-line
    "jw" 'evil-avy-goto-word-or-subword-1
    "ju" 'avy-goto-url
    "jU" 'avy-open-url)
  :config
  (defun avy-goto-url ()
    "Use avy to go to an URL in the buffer."
    (interactive)
    (avy-jump "https?://"))
  (defun avy-open-url ()
    "Use avy to select an URL in the buffer and open it."
    (interactive)
    (save-excursion
      (avy-goto-url)
      (browse-url-at-point))))

(provide 'jl-avy)
;;; jl-avy.el ends here
