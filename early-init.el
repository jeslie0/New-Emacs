;;; early-init.el -*- lexical-binding: t; -*-

;; We use straight.el for packages, hence we don't want to initialise
;; package.el.
(setq package-enable-at-startup nil)

;; This makes newer versions of files be prioritised over older
;; ones. Makes newer non-compiled files be used rather than older
;; compiled ones.
(setq load-prefer-newer t)

;; A big contributor to startup times is garbage collection. We up the gc
;; threshold to temporarily prevent it from running, then reset it later by
;; enabling `gcmh-mode'. Not resetting it will cause stuttering/freezes.
(setq gc-cons-threshold most-positive-fixnum)

;; (unless (or (daemonp)
;;             noninteractive
;;             init-file-debug)
;;   (let ((old-file-name-handler-alist file-name-handler-alist))
;;     ;; `file-name-handler-alist' is consulted on each `require', `load' and
;;     ;; various path/io functions. You get a minor speed up by unsetting this.
;;     ;; Some warning, however: this could cause problems on builds of Emacs where
;;     ;; its site lisp files aren't byte-compiled and we're forced to load the
;;     ;; *.el.gz files (e.g. on Alpine).
;;     (setq-default file-name-handler-alist nil)
;;     ;; ...but restore `file-name-handler-alist' later, because it is needed for
;;     ;; handling encrypted or compressed files, among other things.
;;     (defun doom-reset-file-handler-alist-h ()
;;       (setq file-name-handler-alist
;;             ;; Merge instead of overwrite because there may have bene changes to
;;             ;; `file-name-handler-alist' since startup we want to preserve.
;;             (delete-dups (append file-name-handler-alist
;;                                  old-file-name-handler-alist))))
;;     (add-hook 'emacs-startup-hook #'doom-reset-file-handler-alist-h 101))

;;  ;; Premature redisplays can substantially affect startup times and produce
;;   ;; ugly flashes of unstyled Emacs.
;;   (setq-default inhibit-redisplay t
;; 		inhibit-message t)
;;   (add-hook 'window-setup-hook
;; 	    (lambda ()
;; 	      (setq-default inhibit-redisplay nil
;; 			    inhibit-message nil)
;; 	      (redisplay)))

;;   ;; Site files tend to use `load-file', which emits "Loading X..." messages in
;;   ;; the echo area, which in turn triggers a redisplay. Redisplays can have a
;;   ;; substantial effect on startup times and in this case happens so early that
;;   ;; Emacs may flash white while starting up.
;;   (define-advice load-file (:override (file) silence)
;;     (load file nil 'nomessage))

;;   ;; Undo our `load-file' advice above, to limit the scope of any edge cases it
;;   ;; may introduce down the road.
;;   (define-advice startup--load-user-init-file (:before (&rest _) init-doom)
;;     (advice-remove #'load-file #'load-file@silence)))


;; speedup blub - Taken from Reddit somewhere
;; (let ((default-gc-threshold gc-cons-threshold)
;;       (default-gc-percentage gc-cons-percentage))
;;   (setq gc-cons-threshold most-positive-fixnum
;;         default-gc-percentage 0.8)
;;   (add-hook 'after-init-hook
;;             (lambda ()
;;               (setq gc-cons-percentage default-gc-percentage
;;                     gc-cons-threshold default-gc-threshold))))



;;; Basic UI Stuff
(setq inhibit-startup-message t) ;; Disables the startup message
(scroll-bar-mode -1)   ; Disables visible scroll bar
(tool-bar-mode -1)     ; Disable the toolbar
(tooltip-mode -1)      ; Disable tooltips
(set-fringe-mode 10)   ; Give some breathing room
(menu-bar-mode -1)     ; Disable the menu bar
(blink-cursor-mode -1) ; Makes cursor not blink
(column-number-mode 1) ;; Adds column numbering to the modeline
(electric-pair-mode -1); Turns off automatic pairing of brackets
;; (electric-indent-mode -1) ;; Turns off automatic indenting



;; Make the initial buffer load faster by setting it to fundamental-mode
(setq initial-major-mode 'fundamental-mode)

;; Set the fonts
(defvar jl/prog-font
  "Fira Code")

(defvar jl/text-font
  "Gill Sans")


(set-face-attribute 'default nil :family jl/prog-font :height 110)
;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :family jl/prog-font :height 110)
;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :family jl/text-font :height 140)

(set-face-attribute 'cursor nil :background "DarkGoldenrod2")
(set-face-attribute 'mode-line-active nil :inherit nil)

(setq frame-inhibit-implied-resize t)

(define-advice load-file (:override (file) silence)
  (load file nil 'nomessage))

(set-language-environment "UTF-8")
;; set-language-enviornment sets default-input-method, which is unwanted
(setq default-input-method nil)
