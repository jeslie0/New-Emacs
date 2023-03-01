;;; Warnings
(setq warning-suppress-types '((comp) (org-roam) (org-element-cache) ()(:warning)))

;;; Solaire Mode
(use-package solaire-mode
  :custom
  (solaire-global-mode +1))

;;; Themes
(defvar after-load-theme-hook nil
  "Hook run after a color theme is loaded using `load-theme'.")

(defadvice load-theme (after run-after-load-theme-hook activate)
  "Run `after-load-theme-hook'."
  (run-hooks 'after-load-theme-hook))

(use-package doom-themes
  :defer t)

(use-package nord-theme
  :defer t)

(use-package dracula-theme
  :defer t)

(use-package vscode-dark-plus-theme
  :defer t)

;;; All the icons
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
    (add-to-list 'all-the-icons-extension-icon-alist '("Jenkinsfile" all-the-icons-fileicon "robot" :height 1.0 :v-adjust -0.2 :face all-the-icons-silver))))

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
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia and Fira Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode
                          '(;; == === ==== => =| =>>=>=|=>==>> ==< =/=//=// =~
                            ;; =:= =!=
                            ("=" (rx (+ (or ">" "<" "|" "/" "~" ":" "!" "="))))
                            ;; ;; ;;;
                            (";" (rx (+ ";")))
                            ;; && &&&
                            ("&" (rx (+ "&")))
                            ;; !! !!! !. !: !!. != !== !~
                            ("!" (rx (+ (or "=" "!" "\." ":" "~"))))
                            ;; ?? ??? ?:  ?=  ?.
                            ("?" (rx (or ":" "=" "\." (+ "?"))))
                            ;; %% %%%
                            ("%" (rx (+ "%")))
                            ;; |> ||> |||> ||||> |] |} || ||| |-> ||-||
                            ;; |->>-||-<<-| |- |== ||=||
                            ;; |==>>==<<==<=>==//==/=!==:===>
                            ("|" (rx (+ (or ">" "<" "|" "/" ":" "!" "}" "\]"
                                            "-" "=" ))))
                            ;; \\ \\\ \/
                            ("\\" (rx (or "/" (+ "\\"))))
                            ;; ++ +++ ++++ +>
                            ("+" (rx (or ">" (+ "+"))))
                            ;; :: ::: :::: :> :< := :// ::=
                            (":" (rx (or ">" "<" "=" "//" ":=" (+ ":"))))
                            ;; // /// //// /\ /* /> /===:===!=//===>>==>==/
                            ("/" (rx (+ (or ">"  "<" "|" "/" "\\" "\*" ":" "!"
                                            "="))))
                            ;; .. ... .... .= .- .? ..= ..<
                            ("\." (rx (or "=" "-" "\?" "\.=" "\.<" (+ "\."))))
                            ;; -- --- ---- -~ -> ->> -| -|->-->>->--<<-|
                            ("-" (rx (+ (or ">" "<" "|" "~" "-"))))
                            ;; *> */ *)  ** *** ****
                            ("*" (rx (or ">" "/" ")" (+ "*"))))
                            ;; www wwww
                            ("w" (rx (+ "w")))
                            ;; <> <!-- <|> <: <~ <~> <~~ <+ <* <$ </  <+> <*>
                            ;; <$> </> <|  <||  <||| <|||| <- <-| <-<<-|-> <->>
                            ;; <<-> <= <=> <<==<<==>=|=>==/==//=!==:=>
                            ;; << <<< <<<<
                            ("<" (rx (+ (or "\+" "\*" "\$" "<" ">" ":" "~"  "!"
                                            "-"  "/" "|" "="))))
                            ;; >: >- >>- >--|-> >>-|-> >= >== >>== >=|=:=>>
                            ;; >> >>> >>>>
                            (">" (rx (+ (or ">" "<" "|" "/" ":" "=" "-"))))
                            ;; #: #= #! #( #? #[ #{ #_ #_( ## ### #####
                            ("#" (rx (or ":" "=" "!" "(" "\?" "\[" "{" "_(" "_"
                                         (+ "#"))))
                            ;; ~~ ~~~ ~=  ~-  ~@ ~> ~~>
                            ("~" (rx (or ">" "=" "-" "@" "~>" (+ "~"))))
                            ;; __ ___ ____ _|_ __|____|_
                            ("_" (rx (+ (or "_" "|"))))
                            ;; Fira code: 0xFF 0x12
                            ("0" (rx (and "x" (+ (in "A-F" "a-f" "0-9")))))
                            ;; Fira code:
                            "Fl"  "Tl"  "fi"  "fj"  "fl"  "ft"
                            ;; The few not covered by the regexps.
                            "{|"  "[|"  "]#"  "(*"  "}#"  "$>"  "^="))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

 ;;; Rainbow
(use-package rainbow-mode
  :hook ((prog-mode text-mode) . rainbow-mode))

;;; Pixel scroll mode
(use-package pixel-scroll
  :straight nil
  :init
  (pixel-scroll-precision-mode))

;;; Line numbers
(use-package display-line-numbers
  :defer t
  :hook ((prog-mode) . display-line-numbers-mode))
