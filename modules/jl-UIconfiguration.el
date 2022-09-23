;;; Warnings
(setq warning-suppress-types '((comp) (org-roam) (org-element-cache) ()(:warning)))

;;; Solaire Mode
(use-package solaire-mode
  :custom
  (solaire-global-mode +1))

;;; Themes
(use-package doom-themes
  :defer t
  :hook (server-after-make-frame . (lambda () (load-theme
					       'doom-palenight t)))
  :init
  (load-theme 'doom-palenight t))

(use-package nord-theme
  :defer t)

(use-package dracula-theme
  :defer t)

;;; All the icons
(use-package all-the-icons
  :straight (all-the-icons :type git :host github :repo "domtronn/all-the-icons.el"
			   :fork (:host github
					:repo "jeslie0/all-the-icons.el")
			   :files (:defaults "data" "all-the-icons.el"))
  :config
  (progn
    (setf (alist-get "v" all-the-icons-extension-icon-alist nil nil #'equal) '(all-the-icons-fileicon "coq" :height 1.0 :v-adjust -0.2 :face all-the-icons-lred))
    (add-to-list 'all-the-icons-data/file-icon-alist '("agda" . "\x1315a"))
    (add-to-list 'all-the-icons-extension-icon-alist '("agda" all-the-icons-fileicon "agda" :height 1.0 :v-adjust -0.2 :face all-the-icons-lblue))
    (add-to-list 'all-the-icons-extension-icon-alist '("lagda" all-the-icons-fileicon "agda" :height 1.0 :v-adjust -0.2 :face all-the-icons-lblue))))

(use-package all-the-icons-dired
  :commands (dired)
  :hook (dired-mode . all-the-icons-dired-mode)
  :custom
  (all-the-icons-dired-monochrome nil))

;;; Modelines
(use-package doom-modeline
  :custom
  (inhibit-compacting-font-caches t)
  :init (doom-modeline-mode))

;;; Emacs Winum
(defun jl/winum-keys ()
  (defhydra window-transient-state (:hint nil)
    "
^Select^               ^Move^              ^Split^               ^Resize^             ^Other
^^^^^-------------------------------------------------------------------------------------------------------------
[_j_/_k_]  down/up       [_J_/_K_] down/up     [_s_] horizontal      [_[_] shrink horiz   [_d_] close current
[_h_/_l_]  left/right    [_H_/_L_] left/right  [_S_]^^^^ horiz & follow  [_]_] enlarge horiz  [_D_] close other
[_1_.._9_] window 1..9   [_r_]^^   rotate fwd  [_v_]^^^^ vertical        [_{_] shrink verti   [_u_] restore prev layout
[_a_]^^    ace-window    [_R_]^^   rotate bwd  [_V_]^^^^ verti & follow  [_}_] enlarge verti  [_U_] restore next layout
[_o_]^^    other frame   ^^^^                                      [_m_/_|_/___] maximize   [_q_] quit
[_w_]^^    other window
"
    ;; Select
    ("j" evil-window-down)
    ("<down>" evil-window-down)
    ("k" evil-window-up)
    ("<up>" evil-window-up)
    ("h" evil-window-left)
    ("<left>" evil-window-left)
    ("l" evil-window-right)
    ("<right>" evil-window-right)
    ("0" winum-select-window-0)
    ("1" winum-select-window-1)
    ("2" winum-select-window-2)
    ("3" winum-select-window-3)
    ("4" winum-select-window-4)
    ("5" winum-select-window-5)
    ("6" winum-select-window-6)
    ("7" winum-select-window-7)
    ("8" winum-select-window-8)
    ("9" winum-select-window-9)
    ("a" ace-window)
    ("o" other-frame)
    ("w" other-window)
    ;; Move
    ("J" evil-window-move-very-bottom)
    ("<S-down>" evil-window-move-very-bottom)
    ("K" evil-window-move-very-top)
    ("<S-up>" evil-window-move-very-top)
    ("H" evil-window-move-far-left)
    ("<S-left>" evil-window-move-far-left)
    ("L" evil-window-move-far-right)
    ("<S-right>" evil-window-move-far-right)
    ("r" rotate-windows-forward)
    ("R" rotate-windows-backward)
    ;; Split
    ("s" split-window-below)
    ("S" split-window-below-and-focus)
    ("-" split-window-below-and-focus)
    ("v" split-window-right)
    ("V" split-window-right-and-focus)
    ("/" split-window-right-and-focus)
    ("m" toggle-maximize-buffer)
    ("|" maximize-vertically)
    ("_" maximize-horizontally)
    ;; Resize
    ("[" shrink-window-horizontally)
    ("]" enlarge-window-horizontally)
    ("{" shrink-window)
    ("}" enlarge-window)
    ;; Other
    ("d" delete-window)
    ("D" delete-other-windows)
    ("u" winner-undo)
    ("U" winner-redo)
    ("q" nil :exit t))

  (jl/SPC-keys
    "0" '(winum-select-window-0 :which-key "Select window 0")
    "1" '(winum-select-window-1 :which-key "Select window 1")
    "2" '(winum-select-window-2 :which-key "Select window 2")
    "3" '(winum-select-window-3 :which-key "Select window 3")
    "4" '(winum-select-window-4 :which-key "Select window 4")
    "5" '(winum-select-window-5 :which-key "Select window 5")
    "6" '(winum-select-window-6 :which-key "Select window 6")
    "7" '(winum-select-window-7 :which-key "Select window 7")
    "8" '(winum-select-window-8 :which-key "Select window 8")
    "9" '(winum-select-window-9 :which-key "Select window 9")
    "w." 'window-transient-state/body))
(use-package winum
  :after doom-modeline
  :config (winum-mode)
  :diminish winum-mode
  :config
  (jl/winum-keys)
  ;; Usefull functions
(defun split-window-below-and-focus ()
  "Split the window vertically and focus the new window."
  (interactive)
  (split-window-below)
  (windmove-down)
  (when (and (boundp 'golden-ratio-mode)
             (symbol-value golden-ratio-mode))
    (golden-ratio)))

(defun split-window-right-and-focus ()
  "Split the window horizontally and focus the new window."
  (interactive)
  (split-window-right)
  (windmove-right)
  (when (and (boundp 'golden-ratio-mode)
             (symbol-value golden-ratio-mode))
    (golden-ratio)))



  ;; Makes window keys appear in one place
  (push '(("\\(.*\\) 1" . "winum-select-window-1") . ("\\1 1..9" . "window 1..9"))
        which-key-replacement-alist)
  (push '((nil . "winum-select-window-[2-9]") . t) which-key-replacement-alist))

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

;;; TODO Fillings
(add-hook 'prog-mode-hook 'auto-fill-mode)
(setq comment-auto-fill-only-comments t)
(add-hook 'text-mode-hook 'visual-line-mode)

;;; Recentf
(use-package recentf
  :config
  (add-to-list 'recentf-exclude (expand-file-name "~/.elfeed/index"))
  (add-to-list 'recentf-exclude (expand-file-name "~/.dotfiles/.emacs.d/bookmarks"))
  (add-to-list 'recentf-exclude (expand-file-name (concat user-emacs-directory "bookmarks")))
  (add-to-list 'recentf-exclude (expand-file-name "~/.dotfiles/.emacs.d/ReadMe.org")))

;;; ligature.el
(use-package ligature
  :after prog-mode
  :straight (:host github :repo "mickeynp/ligature.el" :branch "master" :files ("ligature.el"))
  :config
  (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                       ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                       "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                       "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                       "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                       "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                       "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                       "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                       "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                       "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

  (global-ligature-mode 't))

 ;;; Rainbow
(use-package rainbow-mode
  :hook ((prog-mode text-mode) . rainbow-mode))

;;; Pixel scroll mode
(use-package pixel-scroll
  :straight nil
  :init
  (pixel-scroll-precision-mode))
