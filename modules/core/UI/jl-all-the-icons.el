;;; jl-all-the-icons.el --- jl all-the-icons configuration -*- lexical-binding: t -*-

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

(use-package all-the-icons
  :straight (all-the-icons :type git :host github :repo "domtronn/all-the-icons.el"
			   :fork (:host github
					:repo "jeslie0/all-the-icons.el")
			   :files (:defaults "data" "all-the-icons.el"))
  :config
  (progn
    (setf (alist-get "v" all-the-icons-extension-icon-alist nil nil #'equal) '(all-the-icons-fileicon "coq" :height 1.0 :v-adjust -0.2 :face all-the-icons-lred))
    (add-to-list 'all-the-icons-data/file-icon-alist '("agda" . "\x1315a"))
    (add-to-list 'all-the-icons-extension-icon-alist '("agda" all-the-icons-fileicon "agda" :height 1.0 :v-adjust -0.2 :face all-the-icons-lblue))
    (add-to-list 'all-the-icons-extension-icon-alist '("lagda" all-the-icons-fileicon "agda" :height 1.0 :v-adjust -0.2 :face all-the-icons-lblue))))

(provide 'jl-all-the-icons)
;;; jl-all-the-icons.el ends here
