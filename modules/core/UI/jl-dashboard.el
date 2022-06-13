;;; jl-dashboard.el --- jl dashboard configuration -*- lexical-binding: t -*-

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

(use-package dashboard
  :general
  (jl/SPC-keys
    :no-autoload t
    "bh" 'buffer-visit-dashboard)
  (:keymaps 'dashboard-mode-map
            :states '(normal motion)
            :no-autoload t
            "j"  'widget-forward
            "k"  'widget-backward)
  :custom
  ;; Set the title
  (dashboard-banner-logo-title "Welcome to Emacs")
  ;; Set the logo
  (dashboard-startup-banner (expand-file-name "Icons/EmacsLogo.svg" user-emacs-directory))
  (dashboard-image-banner-max-width 300)

  ;; Content is not centered by default. To center, set
  (dashboard-center-content t)

  ;; To disable shortcut "jump" indicators for each section, set
  (dashboard-show-shortcuts nil)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-set-init-info t)
  ;; (dashboard-projects-switch-function 'counsel-projectile-switch-project-by-name)
  (dashboard-items '((recents . 5)
		     (projects . 5)
))

  (initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

  :config
  (defun buffer-visit-dashboard ()
    (interactive)
    (switch-to-buffer "*dashboard*")
    (dashboard-refresh-buffer))
  (dashboard-setup-startup-hook)
  (dashboard-refresh-buffer))

(provide 'jl-dashboard)
;;; jl-dashboard.el ends here
