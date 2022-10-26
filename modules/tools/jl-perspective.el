;;; Perspective
(defun jl/kill-this-buffer (&optional arg)
  "Kill the current buffer.
If the universal prefix argument is used then kill also the window."
  (interactive "P")
  (if (window-minibuffer-p)
      (abort-recursive-edit)
    (if (equal '(4) arg)
        (kill-buffer-and-window)
      (kill-buffer))))

(defun toggle-centered-buffer ()
  "Toggle visual centering of the current buffer."
  (interactive)
  (cl-letf ((writeroom-maximize-window nil)
         (writeroom-mode-line t))
    (call-interactively 'writeroom-mode)))

(defun toggle-distraction-free ()
  "Toggle visual distraction free mode."
  (interactive)
  (cl-letf ((writeroom-maximize-window t)
         (writeroom-mode-line nil))
    (call-interactively 'writeroom-mode)))

(use-package perspective
  :defer .1
  :general
  ("C-x k" 'persp-kill-buffer*)
  (jl/SPC-keys
    "b'" 'persp-switch-by-number
    "ba" 'persp-add-buffer
    "bA" 'persp-set-buffer
    "bD" 'persp-remove-buffer
    "bd" '(jl/kill-this-buffer :which-key: "kill-this-buffer")
    "bi" 'persp-import
    "bk" '(persp-kill :which-key "kill perspective")
    "bn" 'next-buffer
    "bN" 'persp-next
    "bp" 'previous-buffer
    "bP" 'persp-prev
    "br" 'rename-buffer
    "bs" '(persp-switch :which-key "switch perspective")
    "bS" 'persp-state-save
    "bL" 'persp-state-load

    "bR" 'revert-buffer)
  :config
  (setq persp-suppress-no-prefix-key-warning t)
  (persp-mode))
