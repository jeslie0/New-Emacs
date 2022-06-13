;;; jl-corfu.el --- jl corfu configuration -*- lexical-binding: t -*-

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

(use-package corfu
  :general
  (:keymaps 'corfu-map
            "TAB" 'corfu-next
            [tab] 'corfu-next
            "C-j" 'corfu-next
            "S-TAB" 'corfu-previous
            [backtab] 'corfu-previous
            "C-k" 'corfu-previous
            [escape] 'jl/corfu-quit
            )
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  (corfu-separator ?\s)          ;; Orderless field separator
  (corfu-quit-at-boundary t)     ;; Quit at completion boundary
  (corfu-quit-no-match t)        ;; Quit if there is no match
  (corfu-preview-current nil)    ;; Disable current candidate preview
  (corfu-preselect-first t)      ;; Enable candidate preselection
  (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  (corfu-echo-documentation nil) ;; Disable documentation in the echo area
  (corfu-scroll-margin 5)        ;; Use scroll margin
  ;; Works with `indent-for-tab-command'. Make sure tab doesn't indent when you
  ;; want to perform completion
  (tab-always-indent 'complete)

  ;; You may want to enable Corfu only for certain modes.
  :hook ((prog-mode . corfu-mode)
         (text-mode . corfu-mode)
         (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since dabbrev can be used globally (M-/).
  :init
  (defun jl/corfu-quit ()
    (interactive)
    (corfu-quit)
    (evil-normal-state))
  :config
  (global-corfu-mode)

  (general-define-key :keymaps 'corfu-map
                      :states 'insert
                      [escape] 'jl/corfu-quit))

(provide 'jl-corfu)
;;; jl-corfu.el ends here
