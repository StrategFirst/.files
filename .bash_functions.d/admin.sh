#!/bin/bash

function admin_apt() {
	steps="update upgrade clean autoremove autoclean"
	for step in $steps
	do
		echo -e "\033[92m • $step \033[0m"
		sudo apt $step
	done
}

function admin_backup_bw() { # Personnal :)
	filename="bitwarden-backup-$(date +%d-%m-%Y).tar.gz"
	echo sudo tar -zcf ~/$filename /home/bitwarden/
	echo sudo chown pi ~/$filename
}