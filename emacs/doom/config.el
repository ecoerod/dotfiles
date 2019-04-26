;;;  -*- lexical-binding: t; -*-

(setq doom-theme
      'doom-tomorrow-night
      doom-font
      (font-spec :name "Iosevka" :size 16))

(map! :map evil-motion-state-map
      "¡" 'evil-beginning-of-line
      "ç" 'evil-end-of-line)

(add-to-list 'company-frontends 'company-preview-frontend)

(add-hook 'after-init-hook 'global-company-mode)

(setq confirm-kill-emacs nil)

(setq persp-interactive-init-frame-behaviour-override -1
      persp-emacsclient-init-frame-behaviour-override -1)

(add-to-list 'auto-mode-alist '("\\.xsd$" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.php$'" . php-mode))

(setq nxml-auto-insert-xml-declaration-flag t)
      ;;nxml-slash-auto-complete-flag t)

(setq org-latex-listings 'minted
      org-latex-packages-alist '(("cache=false" "minted"))
      org-latex-minted-options '(("linenos" "true")
                                 ("breaklines")
                                 ("breakbefore" "."))
      org-latex-image-default-width "0.5\\textwidth"
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(add-hook! nxml-mode
  (company-mode))

(add-to-list 'company-backends 'company-nxml)

(setq company-idle-delay 0.2
      company-minimum-prefix-length 2)

(after! ox-latex
  (add-to-list 'org-latex-classes
             '("report"
               "\\documentclass[openany,a4paper,11pt,hidelinks,oneside]{memoir}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
 (add-to-list 'org-latex-packages-alist '("" "minted")
    (setq org-latex-listings 'minted
          org-latex-packages-alist '(("cache=false" "minted"))
          org-latex-minted-options '(("linenos" "true")
                                     ("breaklines")
                                     ("breakbefore" ".")))))
