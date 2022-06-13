;;; jl-eshell-did-you-mean.el --- jl eshell-did-you-mean configuration -*- lexical-binding: t -*-

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

(use-package eshell-did-you-mean
  :straight (:host github :repo "xuchunyang/eshell-did-you-mean" :branch "master" :files ("*.el"))
  :after eshell
  :config
  (eshell-did-you-mean-setup))

(provide 'jl-eshell-did-you-mean)
;;; jl-eshell-did-you-mean.el ends here
