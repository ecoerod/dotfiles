;;;  -*- lexical-binding: t; -*-

(setq doom-theme
      'doom-tomorrow-night
      doom-font
      (font-spec :name "Hack" :size 14))

(add-hook! prog-mode
  (local-set-key (kbd "<tab>") 'company-complete))

(setq confirm-kill-emacs nil)

(setq persp-interactive-init-frame-behaviour-override -1
      persp-emacsclient-init-frame-behaviour-override -1)

(define-key evil-motion-state-map "¡" 'evil-beginning-of-line)
(define-key evil-motion-state-map "ç" 'evil-end-of-line)
