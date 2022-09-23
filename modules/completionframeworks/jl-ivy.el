(use-package ivy
  :diminish ;; Hides minor mode from mode-line minor mode list
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1)
  :custom
  (ivy-use-selectable-prompt t)
  )

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-f" . 'counsel-minibuffer-history))
  :init
  (counsel-mode 1)
  (jl/SPC-keys
  "SPC" '(counsel-M-x :which-key "M-x")
  "ff" '(counsel-find-file :which-key "find file")
  "tt" '(counsel-load-theme :which-key "choose theme")
  "bb" '(persp-counsel-switch-buffer :which-key "show local buffers")
  "bB" '(counsel-ibuffer :which-key "show all buffers") ;; DON'T USE THIS, USE C-u SPC b b
  "/" 'counsel-rg))

(use-package ivy-rich
  :after (ivy counsel)
  :config
  (ivy-rich-mode 1))

(use-package all-the-icons-ivy-rich
  :after (ivy ivy-rich all-the-icons)
  :config
  (all-the-icons-ivy-rich-mode 1))

(use-package ivy-prescient
  :after (ivy counsel)
  :custom
  (prescient-sort-length-enable t)
  (ivy-prescient-retain-classic-highlighting t)
  (prescient-save-file (concat user-emacs-directory "prescient-data"))
  :config
  (ivy-prescient-mode 1)
  (prescient-persist-mode 1))
