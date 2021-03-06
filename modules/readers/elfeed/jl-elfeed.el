;;; jl-elfeed.el --- jl elfeed configuration -*- lexical-binding: t -*-

;; Author: James Leslie <jamesleslie@posteo.net>
;; Created: 13-06-2022


;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:

;; commentary

;;; Code:

(use-package elfeed
  :commands (elfeed)
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
                  ("https://www.youtube.com/feeds/videos.xml?channel_id=UCAiiOTio8Yu69c3XnR7nQBQ" youtube system-crafters) ;; System Crafters
                  ("https://www.youtube.com/feeds/videos.xml?channel_id=UCG5h8yHSUS4n7zPnh0dG0SA" youtube georg-rockall-schmidt) ;; Georg Rockall-Schmidt
                  ("https://www.youtube.com/feeds/videos.xml?channel_id=UCxLYtICsUCWdr1YPrj5DtwA" youtube ordinary-things) ;; Ordinary Things
                  ("https://www.youtube.com/feeds/videos.xml?channel_id=UCnEuIogVV2Mv6Q1a3nHIRsQ" youtube carefree-wandering) ;; Carefree Wandering
                  ("https://www.youtube.com/feeds/videos.xml?channel_id=UCR1D15p_vdP3HkrH8wgjQRw" youtube internet-historian) ;; Internet Historian
                  ))
  :config
  (defun elfeed-view-mpv ()
    "Watch a video from URL in MPV"
    (interactive)
    (async-shell-command (format "mpv %s" (thing-at-point-url-at-point)))))

(provide 'jl-elfeed)
;;; jl-elfeed.el ends here
