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
  "Cascadia Code")

(defvar jl/text-font
  "Gill Sans")

(set-face-attribute 'default nil :family jl/prog-font :height 100)
;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :family jl/prog-font :height 100)
;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :family jl/text-font :height 100)

(set-face-attribute 'mode-line-active nil :inherit nil)

(setq frame-inhibit-implied-resize t)

(define-advice load-file (:override (file) silence)
  (load file nil 'nomessage))

(set-language-environment "UTF-8")
;; set-language-enviornment sets default-input-method, which is unwanted
(setq default-input-method nil)
