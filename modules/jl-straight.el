(setq straight-fix-flycheck t                ;; Gives a fix for flycheck
      straight-check-for-modifications '(check-on-save) ;; Gives massive speed up to startup time
      straight-use-package-by-default t
      straight-repository-branch "develop")     ;; Defaults use-package to use straight


;; Install straight package manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(straight-use-package 'org)
