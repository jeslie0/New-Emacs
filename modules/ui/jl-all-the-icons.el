(use-package all-the-icons
  :config
  (progn
    (setf (alist-get "v" all-the-icons-extension-icon-alist nil nil #'equal) '(all-the-icons-fileicon "coq" :height 1.0 :v-adjust -0.2 :face all-the-icons-lred))
    (add-to-list 'all-the-icons-data/file-icon-alist '("agda" . "\x1315a"))
    (add-to-list 'all-the-icons-extension-icon-alist '("agda" all-the-icons-fileicon "agda" :height 1.0 :v-adjust -0.2 :face all-the-icons-lblue))
    (add-to-list 'all-the-icons-extension-icon-alist '("lagda" all-the-icons-fileicon "agda" :height 1.0 :v-adjust -0.2 :face all-the-icons-lblue))
    (add-to-list 'all-the-icons-extension-icon-alist '("purs" all-the-icons-fileicon "purescript" :height 1.0 :v-adjust -0.2 :face all-the-icons-lblue))
    (add-to-list 'all-the-icons-extension-icon-alist '("dhall" all-the-icons-fileicon "nib" :height 1.0 :v-adjust -0.2 :face all-the-icons-purple-alt))
    (add-to-list 'all-the-icons-extension-icon-alist '("robot" all-the-icons-fileicon "robot" :height 1.0 :v-adjust -0.2 :face all-the-icons-silver))
    (add-to-list 'all-the-icons-extension-icon-alist '("jenkinsfile" all-the-icons-fileicon "jenkins" :face all-the-icons-red))

    (add-to-list 'all-the-icons-regexp-icon-alist '("^\\.?Jenkinsfile" all-the-icons-fileicon "jenkins" :face all-the-icons-red))
    (add-to-list 'all-the-icons-mode-icon-alist '(jenkinsfile-mode all-the-icons-fileicon "jenkins" :face all-the-icons-red))))


(use-package all-the-icons-dired
  :commands (dired)
  :hook (dired-mode . all-the-icons-dired-mode)
  :custom
  (all-the-icons-dired-monochrome nil))

(use-package all-the-icons-completion
  :after marginalia
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))

(use-package treemacs-all-the-icons
  :after (treemacs all-the-icons)
  :hook ((treemacs-mode dired-mode) . (lambda ()
					(treemacs-load-theme 'all-the-icons))))
