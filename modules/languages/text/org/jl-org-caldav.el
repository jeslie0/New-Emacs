;;; jl-org-caldav.el --- jl org-caldav configuration -*- lexical-binding: t -*-

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

(defun jl/org-caldav-keybindings ()
  (jl/C-c-keys
   :keymaps 'org-agenda-mode-map
   "S" 'org-caldav-sync)
  )
(use-package org-caldav
  :custom
  (org-caldav-url "https://posteo.de:8443/calendars/jamesleslie")
  (org-caldav-calendar-id "default")
  (org-caldav-inbox "~/Documents/Calendar/Agenda.org")
  (org-caldav-files '("~/Documents/Calendar/Appointments.org"))
  (org-icalendar-timezone "Europe/London")
  (org-caldav-delete-org-entries 'always)
  (org-caldav-delete-calendar-entries 'never)
  :init
  (jl/org-caldav-keybindings))

(provide 'jl-org-caldav)
;;; jl-org-caldav.el ends here
