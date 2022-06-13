;;; jl-org-ref-ivy.el --- jl org-ref-ivy configuration -*- lexical-binding: t -*-

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

(use-package org-ref-ivy
  :commands (org-ref-insert-cite-link
	     org-ref-insert-ref-link)
  :straight org-ref
  :after (org ivy)
  :custom
  (org-ref-insert-link-function 'org-ref-insert-link-hydra/body)
  (org-ref-insert-cite-function 'org-ref-cite-insert-ivy)
  (org-ref-insert-label-function 'org-ref-insert-label-link)
  (org-ref-insert-ref-function 'org-ref-insert-ref-link)
  (org-ref-cite-onclick-function (lambda (_) (org-ref-citation-hydra/body)))
  )

(provide 'jl-org-ref-ivy)
;;; jl-org-ref-ivy.el ends here
