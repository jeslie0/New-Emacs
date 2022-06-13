;;; jl-mu4e.el --- jl mu4e configuration -*- lexical-binding: t -*-

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

;;; Keybindings
(defun jl/mu4e-keys ()
  (jl/major-modes
    :states '(normal visual emacs operator motion)
    :keymaps 'mu4e-compose-mode-map
    :major-modes '(mu4e-compose-mode)
    "," 'message-send-and-exit
    "c" 'message-send-and-exit
    "k" 'message-kill-buffer
    "a" 'message-kill-buffer
    "s" 'message-dont-send         ; saves as draft
    "e" 'mml-secure-message-encrypt-pgpmime
    "S" 'mml-secure-sign-pgpmime
    "f" 'mml-attach-file)

  (jl/major-modes
    :states '(normal visual emacs operator motion)
    :keymaps 'mu4e-headers-mode-map
    :major-modes t
    "c" '(:ignore t :which-key "compose")
    "m" '(:ignore t :which-key "marking")
    "C" 'mu4e-context-switch
    "s" 'mu4e-headers-search
    "O" 'mu4e-headers-change-sortting
    "U" 'mu4e-update-mail-and-index
    "x" 'mu4e-mark-execute-all
    "cr" 'mu4e-compose-reply
    "cf" 'mu4e-compose-forward
    "cc" 'mu4e-compose-new
    "ma" 'mu4e-headers-mark-for-action
    "md" 'mu4e-headers-mark-for-trash
    "m=" 'mu4e-headers-mark-for-untrash
    "mD" 'mu4e-headers-mark-for-delete
    "mR" 'mu4e-headers-mark-for-refile
    "mr" 'mu4e-headers-mark-for-read
    "mu" 'mu4e-headers-mark-for-unread
    "mf" 'mu4e-headers-mark-for-flag
    "mF" 'mu4e-headers-mark-for-unflag
    "mU" 'mu4e-headers-mark-for-unmark
    "m*" 'mu4e-headers-mark-for-something
)

  (jl/major-modes
    :states '(normal visual emacs operator motion)
    :keymaps 'mu4e-view-mode-map
    :major-modes t
    "t" '(:ignore t :which-key "toggle")
    "m" '(:ignore t :which-key "marking")
    "g" '(:ignore t :which-key "url")
    "a" '(:ignore t :which-key "attachments")
    )

  (jl/major-modes
    :states '(normal visual emacs operator motion)
    :keymaps 'mu4e-view-mode-map
    :major-modes t
    "md" 'mu4e-view-mark-for-trash
    "m=" 'mu4e-view-mark-for-untrash
    "mD" 'mu4e-view-mark-for-delete
    "mm" 'mu4e-view-mark-for-move
    "mr" 'mu4e-view-mark-for-refile
    "m+" 'mu4e-view-mark-for-flag
    "m-" 'mu4e-view-mark-for-unflag

    "mu" 'mu4e-view-unmark
    "mU" 'mu4e-view-unmark-all

    "m%" 'mu4e-view-mark-pattern
    "mT" 'mu4e-view-mark-thread
    "mt" 'mu4e-view-mark-subthread
    "m*" 'mu4e-view-mark-for-something
    ;; "m#" 'mu4e-view-mark-
    "mx" 'mu4e-view-marked-execute

    "R" 'mu4e-compose-reply
    "F" 'mu4e-compose-forward
    "C" 'mu4e-compose-new
    "E" 'mu4e-compose-edit

    "gX" 'mu4e-view-fetch-url
    "gx" 'mu4e-view-go-to-url

    "as" 'mu4e-view-save-attachments)

  (general-evil-define-key '(normal motion) 'mu4e-main-mode-map
    "j" 'mu4e~headers-jump-to-maildir))

;;; Mail shortcuts
(defun jl/mu4e-keys ()
  (jl/major-modes
    :states '(normal visual emacs operator motion)
    :keymaps 'mu4e-compose-mode-map
    :major-modes '(mu4e-compose-mode)
    "," 'message-send-and-exit
    "c" 'message-send-and-exit
    "k" 'message-kill-buffer
    "a" 'message-kill-buffer
    "s" 'message-dont-send         ; saves as draft
    "e" 'mml-secure-message-encrypt-pgpmime
    "S" 'mml-secure-sign-pgpmime
    "f" 'mml-attach-file)

  (jl/major-modes
    :states '(normal visual emacs operator motion)
    :keymaps 'mu4e-headers-mode-map
    :major-modes t
    "c" '(:ignore t :which-key "compose")
    "m" '(:ignore t :which-key "marking")
    "C" 'mu4e-context-switch
    "s" 'mu4e-headers-search
    "O" 'mu4e-headers-change-sortting
    "U" 'mu4e-update-mail-and-index
    "x" 'mu4e-mark-execute-all
    "cr" 'mu4e-compose-reply
    "cf" 'mu4e-compose-forward
    "cc" 'mu4e-compose-new
    "ma" 'mu4e-headers-mark-for-action
    "md" 'mu4e-headers-mark-for-trash
    "m=" 'mu4e-headers-mark-for-untrash
    "mD" 'mu4e-headers-mark-for-delete
    "mR" 'mu4e-headers-mark-for-refile
    "mr" 'mu4e-headers-mark-for-read
    "mu" 'mu4e-headers-mark-for-unread
    "mf" 'mu4e-headers-mark-for-flag
    "mF" 'mu4e-headers-mark-for-unflag
    "mU" 'mu4e-headers-mark-for-unmark
    "m*" 'mu4e-headers-mark-for-something
)

  (jl/major-modes
    :states '(normal visual emacs operator motion)
    :keymaps 'mu4e-view-mode-map
    :major-modes t
    "t" '(:ignore t :which-key "toggle")
    "m" '(:ignore t :which-key "marking")
    "g" '(:ignore t :which-key "url")
    "a" '(:ignore t :which-key "attachments")
    )

  (jl/major-modes
    :states '(normal visual emacs operator motion)
    :keymaps 'mu4e-view-mode-map
    :major-modes t
    "md" 'mu4e-view-mark-for-trash
    "m=" 'mu4e-view-mark-for-untrash
    "mD" 'mu4e-view-mark-for-delete
    "mm" 'mu4e-view-mark-for-move
    "mr" 'mu4e-view-mark-for-refile
    "m+" 'mu4e-view-mark-for-flag
    "m-" 'mu4e-view-mark-for-unflag

    "mu" 'mu4e-view-unmark
    "mU" 'mu4e-view-unmark-all

    "m%" 'mu4e-view-mark-pattern
    "mT" 'mu4e-view-mark-thread
    "mt" 'mu4e-view-mark-subthread
    "m*" 'mu4e-view-mark-for-something
    ;; "m#" 'mu4e-view-mark-
    "mx" 'mu4e-view-marked-execute

    "R" 'mu4e-compose-reply
    "F" 'mu4e-compose-forward
    "C" 'mu4e-compose-new
    "E" 'mu4e-compose-edit

    "gX" 'mu4e-view-fetch-url
    "gx" 'mu4e-view-go-to-url

    "as" 'mu4e-view-save-attachments)

  (general-evil-define-key '(normal motion) 'mu4e-main-mode-map
    "j" 'mu4e~headers-jump-to-maildir))
;;; Mu4e contexts
(defun jl/mu4e-shortcuts ()
  (setq mu4e-maildir-shortcuts '(("/Posteo/Inbox" . ?i)
				 ("/Posteo/Sent" . ?s)
				 ("/Posteo/Archive" . ?a)
				 ("/Posteo/University" . ?u)
				 ("/Posteo/Banking" . ?b)
				 ("/Posteo/Crypto" . ?c)
				 ("/Posteo/Friends and Family" . ?f)
				 ("/Posteo/Other" . ?O)
				 ("/Posteo/Important" . ?I))))

;;; mu4e rich text view
(defun jl/mu4e-rich ()
  (setq
   ;; mu4e-html2text-command 'mu4e-shr2text
   mu4e-html2text-command "w3m -dump -T text/html -o display_link_number=true"
   mu4e-view-show-images t
   mu4e-image-max-width 800
   ;; mu4e-view-prefer-html t
   mu4e-use-fancy-chars t))
;;; mu4e attachement warning
(defun jl/mu4e-attachement-warning ()
  (defun mbork/message-attachment-present-p ()
    "Return t if an attachment is found in the current message."
    (save-excursion
      (save-restriction
	(widen)
	(goto-char (point-min))
	(when (search-forward "<#part" nil t) t))))

  (defcustom mbork/message-attachment-intent-re
    (regexp-opt '("I attach"
		  "I have attached"
		  "I've attached"
		  "I have included"
		  "I've included"
		  "see the attached"
		  "see the attachment"
		  "attached file"
		  "Attached"))
    "A regex which - if found in the message, and if there is no
attachment - should launch the no-attachment warning.")

  (defcustom mbork/message-attachment-reminder
    "Are you sure you want to send this message without any attachment? "
    "The default question asked when trying to send a message
containing `mbork/message-attachment-intent-re' without an
actual attachment.")

  (defun mbork/message-warn-if-no-attachments ()
    "Ask the user if s?he wants to send the message even though
there are no attachments."
    (when (and (save-excursion
		 (save-restriction
		   (widen)
		   (goto-char (point-min))
		   (re-search-forward mbork/message-attachment-intent-re nil t)))
	       (not (mbork/message-attachment-present-p)))
      (unless (y-or-n-p mbork/message-attachment-reminder)
	(keyboard-quit))))

  (add-hook 'message-send-hook #'mbork/message-warn-if-no-attachments)
  )
;;; mu4e reply quote
(defun jl/mu4e-reply-quote ()
  ;; customize the reply-quote-string
  (setq message-citation-line-format "On %a, %d %b, %Y at %R %f wrote:\n")
  ;; choose to use the formatted string
  (setq message-citation-line-function 'message-insert-formatted-citation-line))

;;; mu4e pgp
(defun jl/mu4e-pgp ()
  ;; (setq mml-secure-openpgp-sign-with-sender t) ;; Sign all outgoing emails
  (setq mml-secure-openpgp-signers '("86AC9FE03B59F914725208DECF6607D8EB302630"
                                     ;; "7BC253447F901C3EBD46AB5EDDFB27273B2BFBB6" ;; Old key
                                     )) ;; Sign emails with this key
  (add-hook 'mu4e-compose-mode-hook 'mml-secure-message-sign))

;;; mu4e
(use-package mu4e
  :commands mu4e
  :general
  (jl/C-c-keys
    "e" 'mu4e)
  (jl/SPC-keys
    "ae" 'mu4e)
  :straight nil
  :hook ((mu4e-compose-mode . visual-fill-column-mode)
	 ;; (mu4e-compose-mode . variable-pitch-mode)
	 (mu4e-view-mode . visual-fill-column-mode))
  :config
  (jl/mu4e-keys)
  (jl/mu4e-shortcuts)
  (jl/mu4e-contexts)
  (jl/mu4e-rich)
  (jl/mu4e-attachement-warning)
  (jl/mu4e-reply-quote)
  (jl/mu4e-pgp)
  :custom
  (mu4e-maildir "~/.email")
  (mu4e-get-mail-command "mbsync -c ~/.config/mbsync/.mbsyncrc -a")
  (mu4e-compose-signature-auto-include nil)
  (mu4e-view-show-addresses t)
  (mu4e-headers-include-related nil)
  (mu4e-headers-skip-duplicates t)
  (mu4e-headers-auto-update t)
  (mu4e-update-interval 300)
  (message-send-mail-function 'smtpmail-send-it)
  (mu4e-attachment-dir "~/Downloads/")
  (mu4e-change-filenames-when-moving t)
  (mu4e-compose-format-flowed t)
  (mu4e-compose-dont-reply-to-self t)
  (mu4e-sent-messages-behavior 'sent)
  (mu4e-use-fancy-chars t)
  (mu4e-display-update-status-in-modeline nil))


(provide 'jl-mu4e)
;;; jl-mu4e.el ends here
