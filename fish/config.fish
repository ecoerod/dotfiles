# environment variables
set -g -x CFLAGS "-O2"
set -g -x MAKEFLAGS "-j"
set -g -x BROWSER chromium
set -g -x EDITOR emacsclient -t
set -g -x VISUAL emacsclient -c -a emacs
set -g -x fish_greeting ""
set -g -x PATH $PATH $HOME/.local/bin/ $HOME/.yarn/bin $HOME/.config/composer/vendor/bin
set -g -x JAVA_HOME /usr/lib/jvm/default/

# aliases
alias emacs  "emacs -nw"

function emacsw
    emacsclient -c -a emacs $argv 2>/dev/null &
end

function report
  pandoc --filter pandoc-minted $argv[1].rst -o $argv[1].tex --template=$HOME/Dropbox/dotfiles/pandoc/class-report.tex
  lualatex -shell-escape $argv[1].tex 1>/dev/null
  rm $argv[1].{aux,out,log}
end

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

# Spacefish
set SPACEFISH_PROMPT_ORDER time user host dir git package exec_time line_sep jobs exit_code char
# set SPACEFISH_CHAR_SYMBOL λ
set SPACEFISH_USER_SHOW always
set SPACEFISH_USER_COLOR blue
set SPACEFISH_USER_SUFFIX ""
set SPACEFISH_HOST_SHOW always
set SPACEFISH_HOST_COLOR red
set SPACEFISH_HOST_PREFIX (set_color yellow)@
set SPACEFISH_DIR_PREFIX ""
set SPACEFISH_DIR_SUFFIX " "
set SPACEFISH_DIR_COLOR green
# set SPACEFISH_GIT_PREFIX (set_color purple)"["
# set SPACEFISH_GIT_SUFFIX (set_color purple)"] "
# set SPACEFISH_GIT_STATUS_PREFIX " "
# set SPACEFISH_GIT_STATUS_SUFFIX ""

# Base16 Shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh
end

