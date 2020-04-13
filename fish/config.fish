# environment variables
set -g -x CFLAGS "-O2"
set -g -x MAKEFLAGS "-j"
set -g -x BROWSER chromium
set -g -x EDITOR emacs -nw
set -g -x VISUAL emacs -c
set -g -x fish_greeting ""
set -g -x PATH $PATH $HOME/.local/bin/ $HOME/.yarn/bin $HOME/.config/composer/vendor/bin
set -g -x JAVA_HOME /usr/lib/jvm/default/
set -g -x BAT_THEME Tomorrow-Night
set -g -x GPG_TTY (tty)

# aliases
alias emacs  "emacs -nw"

function emacsw
    emacs -c $argv 2>/dev/null &
end

function report
  pandoc --filter pandoc-minted $argv[1].rst -o $argv[1].tex --template=$HOME/Dropbox/dotfiles/pandoc/class-report.tex
  lualatex -shell-escape $argv[1].tex > output.log;
  and lualatex -shell-escape $argv[1].tex >> output.log;
  and rm $argv[1].{aux,log,tex}; and xdg-open $argv[1].pdf 2> /dev/null &
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
set SPACEFISH_CHAR_SYMBOL λ
set SPACEFISH_USER_SHOW always
set SPACEFISH_USER_COLOR blue
set SPACEFISH_USER_SUFFIX ""
set SPACEFISH_HOST_SHOW always
set SPACEFISH_HOST_COLOR red
set SPACEFISH_HOST_PREFIX (set_color yellow)@
set SPACEFISH_DIR_PREFIX ""
set SPACEFISH_DIR_SUFFIX " "
set SPACEFISH_DIR_COLOR green

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell"
    source "$BASE16_SHELL/profile_helper.fish"
end

# Async
set -g async_prompt_functions _pure_prompt_git
