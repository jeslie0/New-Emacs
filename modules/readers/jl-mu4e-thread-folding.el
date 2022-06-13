;;; jl-mu4e-thread-folding.el --- jl mu4e-thread-folding configuration -*- lexical-binding: t -*-

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

(use-package mu4e-thread-folding
  :defer t
  :after mu4e
  :straight (:host github :repo "rougier/mu4e-thread-folding" :branch "master" :files ("*.el"))
  :hook (mu4e-headers-mode . mu4e-thread-folding-mode)
  :custom
  (mu4e-headers-found-hook '(mu4e-headers-mark-threads mu4e-headers-fold-all))
  (mu4e-headers-fields '((:empty         .    2)
                         (:human-date    .   12)
                         (:flags         .    6)
                         (:mailing-list  .   10)
                         (:from          .   22)
                         (:subject       .   nil)))
  :config
  (add-to-list 'mu4e-header-info-custom
               '(:empty . (:name "Empty"
				 :shortname ""
				 :function (lambda (msg) "  "))))
  (define-key mu4e-headers-mode-map (kbd "<tab>")     'mu4e-headers-toggle-at-point)
  (define-key mu4e-headers-mode-map (kbd "<left>")    'mu4e-headers-fold-at-point)
  (define-key mu4e-headers-mode-map (kbd "<S-left>")  'mu4e-headers-fold-all)
  (define-key mu4e-headers-mode-map (kbd "<right>")   'mu4e-headers-unfold-at-point)
  (define-key mu4e-headers-mode-map (kbd "<S-right>") 'mu4e-headers-unfold-all))

(provide 'jl-mu4e-thread-folding)
;;; jl-mu4e-thread-folding.el ends here
