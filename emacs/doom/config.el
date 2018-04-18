;;;  -*- lexical-binding: t; -*-

(setq doom-theme
      'doom-tomorrow-night
      doom-font
      (font-spec :name "Hack" :size 14))

(add-hook! prog-mode
  (local-set-key (kbd "<tab>") 'company-complete))

(setq confirm-kill-emacs nil)
