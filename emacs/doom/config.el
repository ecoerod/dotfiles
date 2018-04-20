;;;  -*- lexical-binding: t; -*-

(setq doom-theme
      'doom-tomorrow-night
      doom-font
      (font-spec :name "Hack" :size 14))

(map! :mode prog-mode
      :i "<tab>" 'company-complete)

(map! :map evil-motion-state-map
      "¡" 'evil-beginning-of-line
      "ç" 'evil-end-of-line)

(setq confirm-kill-emacs nil)

(setq persp-interactive-init-frame-behaviour-override -1
      persp-emacsclient-init-frame-behaviour-override -1)
