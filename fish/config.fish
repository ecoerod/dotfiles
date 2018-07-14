# environment variables
set -g -x CFLAGS "-O2"
set -g -x MAKEFLAGS "-j"
set -g -x BROWSER chromium
set -g -x EDITOR emacsclient -t
set -g -x VISUAL emacsclient -c -a emacs
set -g -x fish_greeting ""
set -g -x PATH $PATH $HOME/.local/bin/ $HOME/.yarn/bin
set -g -x JAVA_HOME /usr/lib/jvm/default/

# aliases
alias emacs  "emacsclient -t"
alias emacsw "emacsclient -c -a emacs"

# pyenv settings
set -g -x PYENV_ROOT $HOME/.pyenv
set -g -x PATH $PYENV_ROOT/bin $PATH
status --is-interactive; and source (pyenv init - | psub)

if test -n "$EMACS"
  set -x TERM eterm-color
end

function fish_title
  true
end

# Base16 Shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh
end

