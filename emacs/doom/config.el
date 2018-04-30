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

(add-to-list 'auto-mode-alist '(".xsd" . nxml-mode))

(setq nxml-auto-insert-xml-declaration-flag t
      nxml-slash-auto-complete-flag t)

(setq org-latex-listings 'minted
      org-latex-packages-alist '(("cache=false" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

