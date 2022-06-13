;;; jl-projectile.el --- jl projectile configuration -*- lexical-binding: t -*-

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

(use-package projectile
  :diminish projectile-mode
  :general
  (jl/SPC-keys
    ;; Project
    "p!" 'projectile-run-shell-command-in-root
    "p&" 'projectile-run-async-shell-command-in-root
    "p%" 'projectile-replace-regexp
    "pa" 'projectile-toggle-between-implementation-and-test
    ;; "pb" 'projectile-switch-to-buffer
    "pc" 'projectile-compile-project
    ;; "pd" 'projectile-find-dir
    "pD" 'projectile-dired
    "pe" 'projectile-edit-dir-locals
    ;; "pf" 'projectile-find-file
    "pF" 'projectile-find-file-dwim
    "pg" 'projectile-find-tag
    "pG" 'projectile-regenerate-tags
    "pI" 'projectile-invalidate-cache
    "pk" 'projectile-kill-buffers
    ;; "pp" 'projectile-switch-project
    ;; "pr" 'projectile-recentf
    "pR" 'projectile-replace
    "pT" 'projectile-test-project
    "pv" 'projectile-vc)
  :init
  (projectile-mode))

(provide 'jl-projectile)
;;; jl-projectile.el ends here
