;;; VIBED
(defun jgl/svn-info (dir item)
  "Return `svn info --show-item ITEM' for DIR (needs svn >= 1.9)."
  (let ((default-directory (file-name-as-directory dir)))
    (car (process-lines "svn" "info" "--show-item" item))))

(defun jgl/svn-split-layout (url)
  "Split URL into (BASE . CURRENT) for a trunk/branches/tags layout.
BASE is the project root URL, CURRENT is e.g. \"trunk\" or \"branches/foo\".
Return nil if URL doesn't follow the layout."
  (when (string-match
         "\\`\\(.*?\\)/\\(trunk\\|branches/[^/]+\\|tags/[^/]+\\)\\(?:/.*\\)?\\'"
         url)
    (cons (match-string 1 url) (match-string 2 url))))

(defun jgl/vc-svn-create-tag (dir name branchp)
  "Create a branch (BRANCHP) or tag in Subversion, prompting for source and dest.
NAME is whatever the user typed at VC's first prompt; it is used as the
default name for the new branch/tag."
  (let* ((url    (jgl/svn-info dir "url"))
         (layout (jgl/svn-split-layout url))
         (base   (if layout (car layout) (jgl/svn-info dir "repos-root-url")))
         (cur    (if layout
                     (concat base "/" (cdr layout))
                   url))
         (folder (if branchp "branches" "tags"))
         (src    (read-string "Copy from: " cur))
         (dest   (read-string (format "New %s URL: " (if branchp "branch" "tag"))
                              (if (string-match-p "://" name)
                                  name
                                (format "%s/%s/%s" base folder name))))
         (msg    (read-string "Log message: "
                              (format "Create %s %s"
                                      (if branchp "branch" "tag")
                                      (file-name-nondirectory dest)))))
    (vc-svn-command nil 0 nil "copy" "-m" msg src dest)
    (when branchp
      (vc-svn-retrieve-tag dir dest nil))))   ; svn switch to the new branch

(defun jgl/vc-svn-switch-branch ()
  "Switch the SVN working copy to another URL, prompting with the branches folder."
  (let* ((dir    (vc-root-dir))
         (url    (jgl/svn-info dir "url"))
         (layout (jgl/svn-split-layout url))
         (base   (if layout (car layout) (jgl/svn-info dir "repos-root-url")))
         (target (read-string "Switch to URL: " (concat base "/branches/"))))
    (let ((default-directory (file-name-as-directory dir)))
      (vc-svn-command nil 0 nil "switch" target))
    (vc-resynch-buffers-in-directory dir t t)
    (message "Switched to %s" target)))

(defun jgl/vc-switch-branch ()
  "Like `vc-switch-branch', but with a smarter prompt under Subversion."
  (interactive)
  (if (eq (vc-responsible-backend default-directory) 'SVN)
      (jgl/vc-svn-switch-branch)
    (call-interactively #'vc-switch-branch)))

;; Emacs 28+: replace the stock binding (C-x v b s)
(with-eval-after-load 'vc
  (define-key vc-prefix-map (kbd "b s") #'jgl/vc-switch-branch))
;;; END-VIBED

(use-package vc
  :defer t
  :general
  (jl/SPC-keys
    :prefix-map 'vc-prefix-map
    :prefix "SPC g v")
  ;; Doesn't work
  (jl/major-modes
    :keymap 'log-edit-mode-map
    :states '(normal visual operator)
    :major-modes t
    "," #'log-edit-done
    "a" #'log-edit-kill-buffer)
  (jl/SPC-keys
    "gv" '(:ignore t :which-key "VC")
    "gvb" '(:ignore t :which-key "Branches")
    "gvbs" #'jgl/vc-switch-branch
    "gvM" '(:ignore t :which-key "Mergebase"))
  :init
  (with-eval-after-load 'vc-svn
    (advice-add 'vc-svn-create-tag :override #'jgl/vc-svn-create-tag))
  )
