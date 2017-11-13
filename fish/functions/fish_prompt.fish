# Colors
set yellow (set_color -o yellow) 
set blue (set_color -o blue)
set red (set_color -o red)


# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead blue
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '⏩'
set __fish_git_prompt_char_untrackedfiles '🌟'
set __fish_git_prompt_char_stashstate '📦'
set __fish_git_prompt_char_upstream_ahead '➕'
set __fish_git_prompt_char_upstream_behind '➖'
set __fish_git_prompt_char_upstream_equal '✅'

function fish_prompt
    set last_status $status
    
    if [ $SSH_CONNECTION ]
        yellow
        printf 'SSH '
        set_color normal
    end

    set_color -o blue
    printf '%s' (whoami)
    set_color -o yellow
    printf '@'

    set_color -o red
    printf '%s' (hostname|cut -d . -f 1)
    set_color normal
    printf ' '

    set_color -o $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal

    printf '%s ' (__fish_git_prompt)

    # Line 2
    echo
    if test $VIRTUAL_ENV
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end
    printf 'λ '
    set_color normal
end
