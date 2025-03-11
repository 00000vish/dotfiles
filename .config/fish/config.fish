set fish_greeting

set -g fish_color_normal '#ffffff'
set -g fish_color_command '#eeeeee'
set -g fish_color_param '#dddddd'
set -g fish_color_keyword '#cccccc'
set -g fish_color_quote '#bbbbbb'
set -g fish_color_redirection '#aaaaaa'
set -g fish_color_end '#999999'
set -g fish_color_comment '#888888'
set -g fish_color_error '#777777'
set -g fish_color_gray '#666666'
set -g fish_color_selection --background='#333333'
set -g fish_color_search_match --background='#444444'
set -g fish_color_option '#555555'
set -g fish_color_operator '#666666'
set -g fish_color_escape '#777777'
set -g fish_color_autosuggestion '#888888'
set -g fish_color_cancel '#999999'
set -g fish_color_cwd '#aaaaaa'
set -g fish_color_user '#bbbbbb'
set -g fish_color_host '#cccccc'
set -g fish_color_host_remote '#dddddd'
set -g fish_color_status '#eeeeee'
set -g fish_pager_color_progress '#888888'
set -g fish_pager_color_prefix '#777777'
set -g fish_pager_color_completion '#666666'
set -g fish_pager_color_description '#555555'

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ctrl-backspace
bind \cH backward-kill-word

alias lsd 'lsd -al --color=auto'
alias grep 'grep --color=auto'

starship init fish | source