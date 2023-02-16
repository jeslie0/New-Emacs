(use-package flymake-languagetool
  :hook ((text-mode       . flymake-languagetool-load)
         (org-mode . flymake-languagetool-load))
  :init
  (setq flymake-languagetool-server-command `(list ,(executable-find "languagetool-http-server") "--port" flymake-languagetool-server-port)
        flymake-languagetool-server-jar nil
        flymake-languagetool-language "en-GB")
  :config
  (push "WHITESPACE_RULE" flymake-languagetool-disabled-rules)
  (push "EN_UNPAIRED_BRACKETS" flymake-languagetool-disabled-rules)
  (make-process
   :name "languagetool-server" :noquery t :connection-type 'pipe
   :buffer " *LanguageTool server*"
   :command (list "languagetool-http-server" "--port" flymake-languagetool-server-port)))
