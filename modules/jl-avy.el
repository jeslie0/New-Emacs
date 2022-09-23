(use-package avy
  :custom
  (avy-background t)
  :commands
  (avy-pop-mark
   evil-avy-goto-char-timer
   evil-avy-goto-line
   evil-avy-goto-word-or-subword-1
   avy-goto-url
   avy-open-url)
  :general
  (:states '(normal visual motion)
           "f" 'evil-avy-goto-char-timer)
  (jl/SPC-keys
    "jb" 'avy-pop-mark
    "jj" 'evil-avy-goto-char-timer
    "jl" 'evil-avy-goto-line
    "jw" 'evil-avy-goto-word-or-subword-1
    "ju" 'avy-goto-url
    "jU" 'avy-open-url)
  :config
  (defun avy-goto-url ()
    "Use avy to go to an URL in the buffer."
    (interactive)
    (avy-jump "https?://"))
  (defun avy-open-url ()
    "Use avy to select an URL in the buffer and open it."
    (interactive)
    (save-excursion
      (avy-goto-url)
      (browse-url-at-point))))
