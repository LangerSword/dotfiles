#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# opencode
export PATH=/home/lakshaya/.opencode/bin:$PATH
. "$HOME/.cargo/env"

# ntfy login alert (fires only on SSH sessions, not local shells)
if [ -n "$SSH_CONNECTION" ] && [ -z "$LOGIN_ALERT_FIRED" ]; then
  export LOGIN_ALERT_FIRED=1
  /home/lakshaya/.local/bin/login-alert.sh &
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/lakshaya/.lmstudio/bin"
# End of LM Studio CLI section


[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path bash)"


# Added by Antigravity CLI installer
export PATH="/home/lakshaya/.local/bin:$PATH"
