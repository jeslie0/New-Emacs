(use-package elfeed
  :defer t
  :general
  (jl/major-modes
    :keymaps 'elfeed-search-mode-map
    "c"  'elfeed-db-compact
    "gr" 'elfeed-update
    "gR" 'elfeed-search-update--force
    "gu" 'elfeed-unjam
    "o"  'elfeed-load-opml
    "q"  'quit-window
    "w"  'elfeed-web-start
    "W"  'elfeed-web-stop
    "+"  'elfeed-search-tag-all
    "-"  'elfeed-search-untag-all
    "b"  'elfeed-search-browse-url
    "y"  'elfeed-search-yank)
  (jl/major-modes
    :states 'normal
    :keymaps 'elfeed-show-mode-map
    "n" 'elfeed-show-next
    "p" 'elfeed-show-prev
    "v" 'elfeed-view-mpv)
  (jl/SPC-keys
    "are" 'elfeed)
  :custom
  (elfeed-feeds '(("https://golem.ph.utexas.edu/category/atom10.xml" mathematics cat-cafe)
                  ("https://homotopytypetheory.org/feed.xml" mathematics hott)
                  ("https://terrytao.wordpress.com/feed.xml" mathematics terry-tao)
                  ("https://gowers.wordpress.com/feed.xml" mathematics timothy-gowers)
                  ("https://bartoszmilewski.com/feed.xml" mathematics bartosz-milewski)
                  ("http://logic-forall.blogspot.com/feeds/posts/default" mathematics)
                  ("https://jeslie0.github.io/rss.xml" mathematics james-leslie)
                  ("https://www.mohabatmath.ca/feed.xml" mathematics mohabat-tarkeshian)
                  ("https://xkcd.com/atom.xml" webcomic xkcd)
                  ("https://mmhaskell.com/blog/atom.xml" haskell mmm)
                  ("https://www.tweag.io/rss.xml" tweag)
                  ))
  :config
  (defun elfeed-view-mpv ()
    "Watch a video from URL in MPV"
    (interactive)
    (async-shell-command (format "mpv %s" (thing-at-point-url-at-point)))))
