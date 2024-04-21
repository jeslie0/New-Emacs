(use-package writeroom-mode
  :defer t)

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
