(use-package eww
  :defer t
  :commands (eww)
  ;; :hook (eww-mode . variable-pitch-mode)
  :general
  (jl/major-modes
    :keymaps 'eww-mode-map
    :major-modes t
    "s" 'helm-google-suggest
    "S" 'browse-web
    "t" '(org-latex-preview :which-key "view latex")
    "r" 'eww-reload
    "p" 'eww-previous-url
    "n" 'eww-next-url
    "h" 'eww-list-histories
    "d" 'eww-download
    "a" 'eww-add-bookmark
    "lb" 'eww-list-buffers
    "lo" 'eww-list-bookmarks
    "vx" 'eww-browse-with-external-browser
    "vf" 'eww-toggle-fonts
    "vr" 'eww-readable
    "vs" 'eww-view-source)
  (jl/major-modes
    :keymaps 'eww-mode-map
    :major-modes t
    "v" '(:ignore t :which-key "view")
    "l" '(:ignore t :which-key "list"))
  (jl/SPC-keys
    "ate" 'eww)
  (:states 'normal :keymaps 'eww-mode-map
           (kbd "SPC") nil))
