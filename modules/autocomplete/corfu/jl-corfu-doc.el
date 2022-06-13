;;; jl-corfu-doc.el --- jl corfu-doc configuration -*- lexical-binding: t -*-

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

(use-package corfu-doc
  ;; NOTE 2022-02-05: At the time of writing, `corfu-doc' is not yet on melpa
  :straight (corfu-doc :type git :host github :repo "galeo/corfu-doc")
  :after corfu
  :hook (corfu-mode . corfu-doc-mode)
  :custom
  (corfu-doc-delay 1.5)
  (corfu-doc-max-width 70)
  (corfu-doc-max-height 20)

  ;; NOTE 2022-02-05: I've also set this in the `corfu' use-package to be
  ;; extra-safe that this is set when corfu-doc is loaded. I do not want
  ;; documentation shown in both the echo area and in the `corfu-doc' popup.
  (corfu-echo-documentation nil))

(provide 'jl-corfu-doc)
;;; jl-corfu-doc.el ends here
