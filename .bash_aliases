#!/bin/bash

## Colored commands
colored_cmd=( grep egrep fgrep ls )
for clr_cmd in "${colored_cmd[@]}"; do
		alias $clr_cmd="$clr_cmd --color=auto"
done
unset colored_cmd


## ls shorthand
alias ll='ls -l'
alias la='ls -A'
alias l='ls -Cf'
alias lla='ls -la'
