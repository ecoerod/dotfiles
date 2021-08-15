;;; init.el -*- lexical-binding: t; -*-
;; Copy me to ~/.doom.d/init.el or ~/.config/doom/init.el, then edit me!

(doom! :feature
      ;debugger          ; FIXME stepping through code, to help you add bugs
      ;workspaces        ; tab emulation, persistence & separate workspaces

       :completion
       (company          ; the ultimate code completion backend
        +auto)
      ;(helm             ; the *other* search engine for love and life
      ;  +fuzzy)
      ;ido               ; the other *other* search engine...
       (ivy              ; a search engine for love and life
        +fuzzy
        +childframe)

       :ui
      ;deft
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
      ;doom-quit         ; DOOM quit-message prompts when you quit Emacs
      ;fci
       hl-todo           ; highlight TODO/FIXME/NOTE tags
       modeline          ; a snazzy Atom-inspired mode-line
       nav-flash         ; blink the current line after jumping
      ;neotree           ; a project drawer, like NERDTree for vim
       ophints
      ;treemacs
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       (ligatures
        +fira)
      ;tabbar            ; FIXME an (incomplete) tab bar for Emacs
      ;unicode           ; extended unicode support for various languages
      ;vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       vc-gutter
       window-select     ; visually switch windows

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold
       (format 
         +onsave)
      ;lispy
       multiple-cursors
       parinfer
       rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to

       :checkers
       spell
       syntax

       :emacs
       dired             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       imenu             ; an imenu sidebar and searchable code index
       vc

       :tools
      ;ansible
      ;docker
       editorconfig      ; let someone else argue about tabs vs spaces
      ;ein               ; tame Jupyter notebooks with emacs
       eval              ; run code, run (also, repls)
       gist              ; interacting with github gists
       (lookup           ; helps you navigate your code and documentation
        +devdocs         ; ...on devdocs.io online
        +docsets)        ; ...or in Dash docsets locally
       lsp
      ;macos             ; MacOS-specific commands
       make              ; run make tasks from Emacs
       magit             ;
      ;password-store    ; password manager for nerds
       pdf               ; pdf enhancements
      ;prodigy
       rgb               ; creating color strings
       tmux              ; an API for interacting with tmux
       upload            ; map local to remote projects via ssh/ftp
      ;wakatime
      ;vterm

      :term
       eshell            ; a consistent, cross-platform shell (WIP)
       term              ; terminals in Emacs


       :lang
      ;agda
      ;assembly          ; assembly for fun or debugging
      ;(cc +irony +tags) ; C/C++/Obj-C madness
      ;clojure           ; java with a lisp
      ;common-lisp
      ;coq
      ;crystal           ; ruby at the speed of c
      ;csharp            ; unity, .NET, and mono shenanigans
       data              ; config/data formats
      ;erlang            ; an elegant language for a more civilized age
      ;elixir            ; erlang done right
      ;elm               ; care for a cup of TEA?
       emacs-lisp        ; drown in parentheses
      ;ess               ; emacs speaks statistics
      ;go                ; the hipster dialect
       (haskell          ; a language that's lazier than I am
         +intero) 
      ;hy                ; readability of scheme w/ speed of python
      ;idris
      ;(java +meghanada) ; the poster child for carpal tunnel syndrome
       (javascript       ; all(hope(abandon(ye(who(enter(here))))))
         +lsp)
      ;julia             ; a better, faster MATLAB
       latex             ; writing papers in Emacs has never been so fun
      ;ledger            ; an accounting system in Emacs
      ;lua               ; one-based indices? one-based indices
       markdown          ; writing docs for people to ignore
      ;nim
      ;nix               ; I hereby declare "nix geht mehr!"
      ;ocaml             ; an objective camel
       (org              ; organize your plain life in plain text
        +attach          ; custom attachment system
        +babel           ; running code in org
        +capture         ; org-capture in and outside of Emacs
        +export          ; Exporting org to whatever you want
        +present)        ; Emacs for presentations
      ;perl              ; write code no one else can comprehend
       (php              ; perl's insecure younger brother
         +lsp)
      ;plantuml          ; diagrams for confusing people more
      ;purescript        ; javascript, but functional
       (python           ; beautiful is better than ugly
         +lsp)
      ;qt
      ;racket
      ;rest              ; Emacs as a REST client
      ;ruby              ; 1.step do {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
      ;rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
      ;scala             ; java, but good
       (sh               ; she sells (ba|z)sh shells on the C xor
         +fish)
      ;solidity
      ;swift             ; who asked for emoji variables?
      ;terra
       (web               ; the tubes
         +lsp)

       ;; Applications are complex and opinionated modules that transform Emacs
       ;; toward a specific purpose. They may have additional dependencies and
       ;; should be loaded late.
       :app
      ;calendar 
      ;(email +gmail)    ; emacs as an email client
      ;irc               ; how neckbeards socialize
      ;(rss +org)        ; emacs as an RSS reader
      ;twitter           ; twitter client https://twitter.com/vnought
       (write            ; emacs as a word processor (latex + org + markdown)
        +wordnut         ; wordnet (wn) search
        +langtool)       ; a proofreader (grammar/style check) for Emacs

       :collab
      ;floobits
       impatient-mode    ; show off code over HTTP

       :config
       ;; The default module set reasonable defaults for Emacs. It also provides
       ;; a Spacemacs-inspired keybinding scheme, a custom yasnippet library,
       ;; and additional ex commands for evil-mode. Use it as a reference for
       ;; your own modules.
       (default +bindings +smartparens))
