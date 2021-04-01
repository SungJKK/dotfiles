# forked from Toaster https://github.com/oh-my-fish/theme-toaster
# modified slavic-cat theme

set __slavic_color_orange FD971F
set __slavic_color_blue 6EC9DD
set __slavic_color_green A6E22E
set __slavic_color_darkgreen 3E885B
set __slavic_color_yellow E6DB7E
set __slavic_color_pink F92672
set __slavic_color_grey 554F48
set __slavic_color_white F1F1F1
set __slavic_color_purple 9458FF
set __slavic_color_lilac AE81FF

function __slavic_color_echo
  set_color $argv[1]
  if test (count $argv) -eq 2
    echo -n $argv[2]
  end
end

function __slavic_current_folder
  if test $PWD = '/'
    echo -n '/'
  else
    echo -n $PWD | grep -o -E '[^\/]+$'
  end
end

# git status
set __fish_git_prompt_show_informative_status
set __fish_git_prompt_showcolorhints
set __fish_git_prompt_showupstream "auto"

set __fish_git_prompt_color_branch $__slavic_color_darkgreen
set __fish_git_prompt_color_dirtystate $__slavic_color_white
set __fish_git_prompt_color_invalidstate $__slavic_color_lilac
set __fish_git_prompt_color_merging $__slavic_color_yellow
set __fish_git_prompt_color_stagedstate $__slavic_color_yellow
set __fish_git_prompt_color_upstream_ahead $__slavic_color_green
set __fish_git_prompt_color_upstream_behind $__slavic_color_lilac

set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_char_cleanstate ' ✔ '
set __fish_git_prompt_char_conflictedstate ' ! '
set __fish_git_prompt_char_dirtystate ' ✚ '
set __fish_git_prompt_char_invalidstate ' ✖ '
set __fish_git_prompt_char_stagedstate ' ● '
set __fish_git_prompt_char_stashstate ' ⚑ '
set __fish_git_prompt_char_untrackedfiles ' 🔍 '
set __fish_git_prompt_char_upstream_ahead ' ▲ '
set __fish_git_prompt_char_upstream_behind ' ▼ '
set __fish_git_prompt_char_upstream_diverged ' ≠ '
set __fish_git_prompt_char_upstream_equal ' = '

function __slavic_git_status_codes
  echo (git status --porcelain ^/dev/null | sed -E 's/(^.{3}).*/\1/' | tr -d ' \n')
end

function __slavic_git_branch_name
  echo (git rev-parse --abbrev-ref HEAD ^/dev/null)
end

function __slavic_git_status
  # In git
  if test -n (__slavic_git_branch_name)

    if test -n (__slavic_git_status_codes)
      __slavic_color_echo $__slavic_color_blue ' ●'
      __slavic_color_echo $__slavic_color_grey ' (^._.^)ﾉ'
      set_color normal
      __fish_git_prompt
    else
      __slavic_color_echo $__slavic_color_green ' ○'
    end
  end
end

function fish_mode_prompt
  set_color $__slavic_color_lilac
  printf '['
  switch $fish_bind_mode
    case default
      set_color red
      printf 'n'
    case insert
      set_color green
      printf 'i'
    case visual
      set_color magenta
      printf 'v'
  end
  set_color $__slavic_color_lilac
  printf '] '
end

function fish_prompt
  __slavic_color_echo $__slavic_color_purple (prompt_pwd)
  __slavic_git_status

  echo
  __slavic_color_echo $__slavic_color_pink " ⫸  "
end
