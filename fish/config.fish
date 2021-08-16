test $TERM != "tmux-256color"; and exec tmux

# environment variables
set -g -x CFLAGS "-O2"
set -g -x MAKEFLAGS "-j"
set -g -x BROWSER chromium
set -g -x EDITOR emacs -nw
set -g -x VISUAL emacs -c
set -g -x fish_greeting ""
set -g -x PATH $PATH $HOME/.local/bin/ $HOME/.yarn/bin $HOME/.config/composer/vendor/bin $HOME/.rvm/bin
set -g -x JAVA_HOME /usr/lib/jvm/default/
set -g -x BAT_THEME Tomorrow-Night
set -g -x GPG_TTY (tty)

# aliases
# alias emacs  "emacs -nw"

function emacsw
    emacs -c $argv 2>/dev/null &
end

function report
  pandoc --filter pandoc-minted $argv[1].rst -o $argv[1].tex --template=$HOME/Dropbox/dotfiles/pandoc/class-report.tex
  lualatex -shell-escape $argv[1].tex > output.log;
  and lualatex -shell-escape $argv[1].tex >> output.log;
  and rm $argv[1].{aux,log,tex}; and xdg-open $argv[1].pdf 2> /dev/null &
end

# Pyenv
set -g -x PYENV_ROOT $HOME/.pyenv
set -g -x PATH $PYENV_ROOT/bin $PATH
status --is-interactive; and source (pyenv init - | psub)

# RVM
rvm default

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell"
    source "$BASE16_SHELL/profile_helper.fish"
end

function fish_title
  true
end

if test -n "$EMACS"
  set -x TERM eterm-color
end

# Async
set -g async_prompt_functions _pure_prompt_git

# WSL workaround: if on a Windows dir, use Windows git instead of WSL
function is_win_dir
    switch $PWD
        case '/mnt/*'
            true
        case '*' 
            false
    end
end

function git 
    if is_win_dir  
        git.exe $argv
    else
        /usr/bin/git $argv
    end
end

