# environment variables
set -g -x CFLAGS "-O2"
set -g -x MAKEFLAGS "-j"
set -g -x BROWSER chromium
set -g -x EDITOR emacs
set -g -x fish_greeting ""
set -g -x PATH $PATH /home/nelthorim/.local/bin/

# prompt

# pyenv settings
set PYTHONPATH $PYTHONPATH $HOME/.python
status --is-interactive; and . (pyenv init - | psub)

if test -n "$EMACS"
  set -x TERM eterm-color
end

function fish_title
  true
end

# Base16 Shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
end