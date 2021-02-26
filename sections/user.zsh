#
# Username
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

# --------------------------------------------------------------------------
# | SPACESHIP_USER_SHOW | show username on local | show username on remote |
# |---------------------+------------------------+-------------------------|
# | false               | never                  | never                   |
# | always              | always                 | always                  |
# | true                | if needed              | always                  |
# | needed              | if needed              | if needed               |
# --------------------------------------------------------------------------

SPACESHIP_USER_SHOW="${SPACESHIP_USER_SHOW=always}"
SPACESHIP_USER_PREFIX="${SPACESHIP_USER_PREFIX=" 🥙 "}" # Not currently in use
SPACESHIP_USER_SUFFIX="${SPACESHIP_USER_SUFFIX=""}"
SPACESHIP_USER_COLOR="${SPACESHIP_USER_COLOR="057"}"
SPACESHIP_USER_COLOR_ROOT="${SPACESHIP_USER_COLOR_ROOT="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_user() {
  [[ $SPACESHIP_USER_SHOW == false ]] && return

  if [[ $SPACESHIP_USER_SHOW == 'always' ]] \
  || [[ $LOGNAME != $USER ]] \
  || [[ $UID == 0 ]] \
  || [[ $SPACESHIP_USER_SHOW == true && -n $SSH_CONNECTION ]]
  then
    local 'user_color'

    if [[ $USER == 'root' ]]; then
      user_color=$SPACESHIP_USER_COLOR_ROOT
    else
      user_color="$SPACESHIP_USER_COLOR"
    fi

    spaceship::section \
      "$user_color" \
      "%{%K{089}%}🥙 %{%k%}%{%F{089}%}%{%K{202}%}%{%f%}%{%k%}" \
      '%{%K{202}%} %n %{%k%}%{%F{202}%}%{%K{160}%}%{%f%}%{%k%}' \
      "$SPACESHIP_USER_SUFFIX"
  fi
}
