;;; Backup Folder
(setq backup-directory-alist
      `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory)))) ;; Change backup location to a set folder

;;; Auto-saves
(make-directory (expand-file-name "tmp/auto-saves/" user-emacs-directory) t) ;; Put auto-saves into set folder

(setq auto-save-list-file-prefix (expand-file-name "tmp/auto-saves/sessions/" user-emacs-directory)
      auto-save-file-name-transforms `((".*" ,(expand-file-name "tmp/auto-saves" user-emacs-directory) t)))

;;; Files
(use-package ws-butler
 :defer t
 :hook ((prog-mode text-mode) . ws-butler-mode))

;;; Lock files
(setq lock-file-name-transforms `((".*" ,(expand-file-name "tmp/lock-files" user-emacs-directory) t )))

;;; Garbage Collection
(use-package gcmh
  :init
  (gcmh-mode 1))
