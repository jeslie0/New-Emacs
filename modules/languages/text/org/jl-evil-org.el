;;; jl-evil-org.el --- jl evil-org configuration -*- lexical-binding: t -*-

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

(use-package evil-org
  :straight (:host github :repo "Somelauw/evil-org-mode" :branch "master" :files ("evil-org.el"))
  :after org
  :hook (org-mode . evil-org-mode)
  ;; :config
  ;; (use-package evil-org-agenda
  ;;   :defer t
  ;;   :hook (org-agenda-mode . (lambda () (evil-org-agenda-set-keys)))
  ;;   :straight (:host github :repo "Somelauw/evil-org-mode" :branch "master" :files ("evil-org-agenda.el"))
  ;;   :config
  ;;   (evil-org-agenda-set-keys))
  )

(provide 'jl-evil-org)
;;; jl-evil-org.el ends here
