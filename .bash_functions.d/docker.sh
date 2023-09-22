#!/bin/bash

# Fancy cocker containers table
function containers() {
        tableWidth=$(docker ps -a --format "table ┌ {{.ID}} ┬ {{.RunningFor}}\t ┬ {{.Status}} \t ┬ {{.Names}} \t ┐" | head -n 1 | sed -e "s/./#/g" | wc -c)
        terminalWidth=$(tput cols)
        marginLeftSize=$(expr $(expr $terminalWidth - $tableWidth) / 2)
        marginChar=$(echo -e '\u00A0')
        marginLeft=$(repeatc "$marginChar" $marginLeftSize)

        title=" Current containers : "
        centerTitle=$(repeatc "$marginChar" $(expr $(expr $tableWidth - $(echo "$title" | wc -c) ) / 2 ) )

        echo -e "\n$marginLeft\033[38;2;10;187;239m$centerTitle $title \033[1;38;2;10;187;239m"

        docker ps -a --format "table ┌ {{.ID}} ┬ {{.RunningFor}}\t ┬ {{.Status}} \t ┬ {{.Names}} \t ┐ 🚦 -" | head -n 1 | sed -e "s/^/$marginLeft/g" | sed -e "s/[^┌┬┐$marginChar]/$(echo -e '\u2500')/g"
        docker ps -a --format "table │ {{.ID}} │ {{.RunningFor}}\t │ {{.Status}} \t │ {{.Names}} \t │ 🚦  " | head -n 1 | sed -e "s/^/$marginLeft/g"
        docker ps -a --format "table ├ {{.ID}} ┼ {{.RunningFor}}\t ┼ {{.Status}} \t ┼ {{.Names}} \t ┤ 🚦 -" | head -n 1 | sed -e "s/^/$marginLeft/g" | sed -e "s/[^├┼┤$marginChar]/$(echo -e '\u2500')/g"
        docker ps -a --format "table │ {{.ID}} │ {{.RunningFor}}\t │ {{.Status}} \t │ {{.Names}} \t │ 🎯  " | tail -n +2| sed -e "s/^/$marginLeft/g" | sed -e "s/\(Paused.*\)🎯/\1⏸️/g" | sed -e "s/\(Created.*\)🎯/\1⚪/g" | sed -e "s/\(Running.*\)🎯/\1🟢/g" | sed -e "s/\(Up.*\)🎯/\1🟢/g" | sed -e "s/\(Running.*\)🎯/\1🟢/g" | sed -e "s/\(Restarting.*\)🎯/\1🔄/g" | sed -e "s/\(Exited.*\)🎯/\1🔴/g" | sed -e "s/\(Dead.*\)🎯/\1💀/g" | sed -e "s/🎯/❓/g"
        docker ps -a --format "table └ {{.ID}} ┴ {{.RunningFor}}\t ┴ {{.Status}} \t ┴ {{.Names}} \t ┘ 🚦 -" | head -n 1 | sed -e "s/^/$marginLeft/g" | sed -e "s/[^└┴┘$marginChar]/$(echo -e '\u2500')/g"

        echo -e "\033[0m"
}