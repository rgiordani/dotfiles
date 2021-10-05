function fish_right_prompt --description 'Write out the right prompt'
    set -l exit_code $status
    if test $exit_code -ne 0
      set_color red
      echo -n "✘ "
    else
      set_color blue
      echo -n "✔ "
    end

    set_color 777700
    date +%H:%M:%S
    set_color normal
end
