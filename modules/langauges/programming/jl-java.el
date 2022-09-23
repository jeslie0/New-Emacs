(use-package lsp-java
  :defer t
  :hook (java-mode . (lambda ()
                       (require 'lsp-java)
                       (setq lsp-java-server-install-dir "~/emacs-packages/java-language-server/"))))
