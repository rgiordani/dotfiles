function fish_prompt --description 'Write out the prompt'
    set -l realhome ~
    set -l prompt_pwd (echo $PWD | sed -e "s|^$realhome|~|")

    echo -s \
        (set_color 0080ff) "▶ " \
        (set_color ffff00 -o) "$USER" \
        (set_color aaaaaa) "@" \
        (set_color 00aa00) (hostname -s) \
        (set_color aa00aa) " " $prompt_pwd \
        (set_color 000000) (__fish_git_prompt) \
        (set_color ff0000) " › " \
        (set_color normal)
end
