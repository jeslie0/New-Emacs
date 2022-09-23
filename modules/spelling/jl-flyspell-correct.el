(use-package flyspell-correct
  :after (:any flyspell spell-fu)
  :general
  (:keymaps 'flyspell-mode-map
            "C-;"  'flyspell-correct-wrapper)
  :config
  (ispell-set-spellchecker-params))
