## Path to Oh My Fish install.
#set -q XDG_DATA_HOME
#  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
#  or set -gx OMF_PATH "$HOME/.local/share/omf"
#
## Load Oh My Fish configuration.
#source $OMF_PATH/init.fish

# chips
if [ -e ~/.config/chips/build.fish ]
    source ~/.config/chips/build.fish
end

set -U fish_greeting ''

set -gx PATH $HOME/bin $HOME/.local/bin $HOME/go/bin $HOME/.cargo/bin $PATH
set -gx FISH_CLIPBOARD_CMD ""
set -gx LESS "-MMiqRS# 5"
set -gx LESSCHARSET "utf-8"
set -gx LESSEDIT "%E %f"
set -gx PAGER "less"
set -gx BAT_THEME "Monokai Extended Origin"
set -gx EDITOR code -w
set -gx SUDO_EDITOR "$EDITOR"
set -gx BROWSER "google-chrome"
set -gx MAN_POSIXLY_CORRECT "1"

alias git "env LANG=en_US git"

function l
    /bin/ls -alN --group-directories-first --time-style='+%Y-%m-%d %H.%M.%S' --color=auto $argv
end

# Fish git prompt
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showstashstate 'yes'
set -g __fish_git_prompt_showuntrackedfiles 'yes'
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_show_status 1
#set -g __fish_git_prompt_hide_untrackedfiles 1
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_stashstate '↩'
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"
set -g __fish_git_prompt_color_branch blue
set -g __fish_git_prompt_color_upstream_ahead green
set -g __fish_git_prompt_color_upstream_behind red
set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green
