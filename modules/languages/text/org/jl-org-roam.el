;;; jl-org-roam.el --- jl org-roam configuration -*- lexical-binding: t -*-

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

(defun org-roam-force-rebuild-cache ()
  "Rebuild the `org-mode' and `org-roam' cache."
  (interactive)
  (org-id-update-id-locations)
  ;; Note: you may need `org-roam-db-clear-all'
  ;; followed by `org-roam-db-sync'
  (org-roam-db-sync)
  (org-roam-update-org-id-locations))
(defun jl/org-roam-global-keys ()
  (jl/SPC-keys
    "aor" '(:ignore t :which-key "org-roam")
    "aord" '(:ignore t :which-key "dailies")
    "aort" '(:ignore t :which-key "tags")

    "aordy" 'org-roam-dailies-goto-yesterday
    "aordt" 'org-roam-dailies-goto-today
    "aordT" 'org-roam-dailies-goto-tomorrow
    "aordd" 'org-roam-dailies-goto-date
    "aorh" 'org-roam-force-rebuild-cache
    "aorf" 'org-roam-node-find
    "aorn" 'org-roam-node-find
    "aorg" 'org-roam-ui-open
    "aori" 'org-roam-node-insert
    "aorl" 'org-roam-buffer-toggle
    "aorta" 'org-roam-tag-add
    "aortr" 'org-roam-tag-remove
    "aora" 'org-roam-alias-add
    "aorI" 'org-id-get-create
    )
  )

(defun jl/org-roam-key-bindings ()
  (jl/major-modes
    :states '(normal visual motion)
    :keymaps 'org-mode-map
    :major-modes t

    "r" '(:ignore t :which-key "org-roam")
    "rd" '(:ignore t :which-key "dailies")
    "rt" '(:ignore t :which-key "tags")
    "rdy" 'org-roam-dailies-goto-yesterday
    "rdt" 'org-roam-dailies-goto-today
    "rdT" 'org-roam-dailies-goto-tomorrow
    "rdd" 'org-roam-dailies-goto-date
    "rf" 'org-roam-node-find
    "rh" 'org-roam-force-rebuild-cache
    "rn" 'org-roam-node-find
    "rg" 'org-roam-ui-open
    "ri" 'org-roam-node-insert
    "rl" 'org-roam-buffer-toggle
    "rta" 'org-roam-tag-add
    "rtr" 'org-roam-tag-remove
    "ra" 'org-roam-alias-add
    "rI" 'org-id-get-create
    )
  )
(defun jl/org-roam-templates ()
  (setq org-roam-capture-templates
	'(("q" "quick note" plain
	   "%?"
	   :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
	   :unnarrowed t)

	  ("e" "encrypted note" plain
	   "%?"
	   :if-new (file+head "./encrypted/%<%Y%m%d%H%M%S>-${slug}.org.gpg" "#+title: ${title}\n")
	   :unnarrowed t)

	  ("m" "mathematics note" plain
	   "#+LATEX_HEADER: \\input{org-math-packages.tex} \\usepackage{math-macros} \\usepackage{math-environments}\n\n* %?"
	   :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
	   :unnarrowed t)

	  ("f" "film note" plain
	   "%?"
	   :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :films:\n[[id:352cef44-05f6-494c-8f65-c04241335eb0][Films]]\n* %?")
	   :unnarrowed t)
	  )))

(defun jl/org-roam-daily-templates ()
  (setq org-roam-dailies-capture-templates
	'(("d" "default" entry
	   "* %?"
	   :target (file+head "%<%Y-%m-%d>.org"
			      "#+title: %<%Y-%m-%d>\n#+filetags: :Daily:\n [[id:24a82cf2-bc51-4b01-81f7-53968e483ee2][Daily Journal]]\n* [/] Daily Todos\n1. [ ]\n2. [ ]\n3. [ ]\n* Daily Tasks\n* Morning Thoughts\n* Evening Reflections")))))


(use-package org-roam
  :defer t
  :commands (org-roam-node-find
             org-roam-dailies-goto-date
             org-roam-dailies-goto-today
             org-roam-dailies-goto-tomorrow
             org-roam-dailies-goto-yesterday)
  :custom
  (org-roam-v2-ack t)
  (org-roam-graph-viewer #'browse-url-firefox)
  (org-roam-directory "/home/james/Documents/Roam/")
  (org-roam-node-display-template (concat "${title:*} " (propertize "${tags}" 'face 'org-tag)))
  :init
  (jl/org-roam-global-keys)
  :config
  (add-to-list 'org-agenda-files "~/Documents/Roam/daily")
  (jl/org-roam-daily-templates)
  (jl/org-roam-templates)
  (org-roam-db-autosync-mode)
  (jl/org-roam-key-bindings))



(provide 'jl-org-roam)
;;; jl-org-roam.el ends here
