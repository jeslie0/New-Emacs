(use-package lsp-java
  :defer t
  :hook (java-mode . (lambda ()
                       (require 'lsp-java)
                       (setq lsp-java-server-install-dir "~/emacs-packages/java-language-server/"))))

(when (treesit-available-p)
  (use-package java-ts-mode
    :defer t
    :mode ( "\\.java\\'" . java-ts-mode)))
