(setq epa-pinentry-mode 'loopback)
(setq auth-sources '(password-store))
(setq epa-file-encrypt-to '("86AC9FE03B59F914725208DECF6607D8EB302630")
      epa-file-select-keys 1)
(auth-source-pass-enable)
