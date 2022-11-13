;;; Org CalDav
(defun jl/org-caldav-keybindings ()
  (jl/C-c-keys
   :keymaps 'org-agenda-mode-map
   "S" 'org-caldav-sync))

(use-package org-caldav
  :init
  (jl/org-caldav-keybindings))
