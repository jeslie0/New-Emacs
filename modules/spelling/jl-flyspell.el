(use-package flyspell
  :defer t
  :hook
  (prog-mode . flyspell-prog-mode)
  (text-mode . flyspell-mode)
  :general
  (jl/SPC-keys
    "sab" 'add-word-to-dict-buffer
    "sag" 'add-word-to-dict-global
    "sas" 'add-word-to-dict-session
    "sb" 'flyspell-buffer
    "sr" 'flyspell-region
    "sD" 'change-dictionary
    "sn" 'flyspell-goto-next-error
    "ss" 'flyspell-correct-at-point)
  (jl/SPC-keys
    "sa" '(:ignore t :which-key "add word to dict"))
  :custom
  (ispell-dictionary "en_GB")
  :config
  (defun spell-checking/add-flyspell-hook (hook)
    "Add `flyspell-mode' to the given HOOK, if
`spell-checking-enable-by-default' is true."
    (when spell-checking-enable-by-default
      (add-hook hook 'flyspell-mode)))

  (defun change-dictionary ()
    "Change the dictionary. Use the ispell version if
auto-dictionary is not used, use the adict version otherwise."
    (interactive)
    (if (fboundp 'adict-change-dictionary)
        (adict-change-dictionary)
      (call-interactively 'ispell-change-dictionary)))

  (defun add-word-to-dict-buffer ()
    "Save word at point as correct in current buffer."
    (interactive)
    (add-word-to-dict 'buffer))

  (defun add-word-to-dict-global ()
    "Save word at point as a correct word globally."
    (interactive)
    (add-word-to-dict 'save))

  (defun add-word-to-dict-session ()
    "Save word at point as correct in current session."
    (interactive)
    (add-word-to-dict 'session))

  (defun add-word-to-dict (scope)
    "Save word at point as a correct word.
SCOPE can be:
`save' to save globally,
`session' to save in current session or
`buffer' for buffer local."
    (let ((current-location (point))
          (word (flyspell-get-word)))
      (when (consp word)
        (if (spacemacs//word-in-dict-p (car word))
            (error "%s is already in dictionary" (car word))
          (progn
            (flyspell-do-correct scope nil (car word) current-location
                                 (cadr word) (caddr word) current-location)
            (ispell-pdict-save t))))))

  (defun spacemacs//word-in-dict-p (word)
    "Check if WORD is defined in any of the active dictionaries."
    ;; use the correct dictionary
    (flyspell-accept-buffer-local-defs)
    (let (poss ispell-filter)
      ;; now check spelling of word.
      (ispell-send-string "%\n")	;put in verbose mode
      (ispell-send-string (concat "^" word "\n"))
      ;; wait until ispell has processed word
      (while (progn
               (accept-process-output ispell-process)
               (not (string= "" (car ispell-filter)))))
      ;; Remove leading empty element
      (setq ispell-filter (cdr ispell-filter))
      ;; ispell process should return something after word is sent.
      ;; Tag word as valid (i.e., skip) otherwise
      (or ispell-filter
          (setq ispell-filter '(*)))
      (if (consp ispell-filter)
          (setq poss (ispell-parse-output (car ispell-filter))))
      (or (eq poss t) (stringp poss)))))
