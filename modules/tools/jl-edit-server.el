;;; jl-edit-server.el --- jl edit-server configuration -*- lexical-binding: t -*-

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

(use-package edit-server
  :commands edit-server-start
  :init (if after-init-time
              (edit-server-start)
            (add-hook 'after-init-hook
                      #'(lambda() (edit-server-start))))
  ;; :config (setq edit-server-new-frame-alist
  ;;               '((name . "Edit with Emacs FRAME")
  ;;                 (top . 200)
  ;;                 (left . 200)
  ;;                 (width . 80)
  ;;                 (height . 25)
  ;;                 (minibuffer . t)
  ;;                 (menu-bar-lines . t)
  ;;                 (window-system . x)))
)

(provide 'jl-edit-server)
;;; jl-edit-server.el ends here
