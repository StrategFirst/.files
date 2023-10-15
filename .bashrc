# If non-interactive stop there
case $- in
    *i*) ;;
      *) return;;
esac


# Configuration
# # History
HISTCONTROL=ignoreboth                                                  # avoid history duplicate
shopt -s histappend                                                     # put history in append mode
HISTSIZE=1000                                                           # history memory length
HISTFILESIZE=2000                                                       # history memory file length

# # Terminal configuration
shopt -s checkwinsize                                                   # enable the window resize after$

# # Prompt configuration
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
force_color_prompt=yes                                                  # Rainbow !! Force color
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# # GCC Color config
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Tool functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
	PROMPT_COMMAND=___prompt_comand;
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



#Custom PATH add
export PATH=~/.local/bin/:$PATH

greetings

