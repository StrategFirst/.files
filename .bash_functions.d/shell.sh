#!/bin/bash

# Custom fancy prompt :)
___prompt_comand() {
	lastReturn="$?"
	
	PS1='${debian_chroot:+($debian_chroot)}'
	PS1+="\n\033[37;3;2m$(date)\033[0m\n"
	if [[ "$lastReturn" != "0" ]]; then
		PS1+=" \[\033[91m\]{$lastReturn}\[\033[0m\] "
	else
		PS1+=" \[\033[92m\]{$lastReturn}\[\033[0m\] "
	fi
	PS1+='${debian_chroot:+($debian_chroot)}\[\033[96m\]\u\[\033[;3;36m\]@\[\033[0m\]\[\033[96m\]\h\[\033[00m\]:'
	if [[ "$lastReturn" != "0" ]]; then
		PS1+='\[\033[01;38;2;208;19;19m\]\w\[\033[00m\]\$ '
	else
		PS1+='\[\033[01;38;2;50;168;100m\]\w\[\033[00m\]\$ '
	fi
	
}

# List all customs functions
function functions() {
	for src in $(find ~/.bash_functions.d/ -type f)
	do  
			source $src

			echo "$src" | sed -e "s/^.bash_functions.d\///g"
			cat $src | grep -E "^function" | sed -e "s/function \([^(]\+\)[({].*/└ \1/g"
			echo
	done
}