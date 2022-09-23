(use-package elfeed-tube
  :straight (:host github :repo "karthink/elfeed-tube")
  :after elfeed
  :demand t
  :bind (:map elfeed-show-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)
         :map elfeed-search-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save))
  :config
  ;; (setq elfeed-tube-auto-save-p nil) ;; t is auto-save (not default)
  ;; (setq elfeed-tube-auto-fetch-p t) ;;  t is auto-fetch (default)
  (elfeed-tube-setup)


  (elfeed-tube-add-feeds '("veritasium"
                         "https://www.youtube.com/playlist?list=PLEoMzSkcN8oMc34dTjyFmTUWbXTKrNfZA"
                         "quanta magazine"
                         "julia computing"
                         "https://www.youtube.com/watch?v=bSVfItpvG5Q"
                         "https://youtu.be/7CM7Ef-dPWQ"
                         "tom scott"))
  )
