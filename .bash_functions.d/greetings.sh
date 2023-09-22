#!/bin/bash

function greetings_ascii_art() {
# # <ascii>
# #                                             .""--..__
# #                      _                     []       ``-.._
# #                   .'` `'.                  ||__           `-._
# #                  /    ,-.\                 ||_ ```---..__     `-.
# #                 /    /:::\\               /|//}          ``--._  `.
# #                 |    |:::||              |////}                `-. \
# #                 |    |:::||             //'///                    `.\
# #                 |    |:::||            //  ||'                      `|
# #                 /    |:::|/        _,-//\  ||
# #                /`    |:::|`-,__,-'`  |/  \ ||
# #              /`  |   |'' ||           \   |||
# #            /`    \   |   ||            |  /||
# #          |`       |  |   |)            \ | ||
# #         |          \ |   /      ,.__    \| ||
# #         /           `         /`    `\   | ||
# #        |                     /        \  / ||
# #        |                     |        | /  ||
# #        /         /           |        `(   ||
# #       /          .           /          )  ||
# #      |            \          |     ________||
# #     /             |          /     `-------.|
# #    |\            /          |              ||
# #    \/`-._       |           /              ||
# #     //   `.    /`           |              ||
# #    //`.    `. |             \              ||
# #   ///\ `-._  )/             |              ||
# #  //// )   .(/               |              ||
# #  ||||   ,'` )               /              //
# #  ||||  /                    /             || 
# #  `\\` /`                    |             // 
# #      |`                     \            ||  
# #     /                        |           //  
# #   /`                          \         //   
# # /`                            |        ||    
# # `-.___,-.      .-.        ___,'        (/    
# #          `---'`   `'----'`
# # </ascii>
	cat ~/.bash_functions.d/greetings.sh | sed -n '/<ascii/,/<\/ascii/ {//! p}' | grep -E "^# #" | sed -e "s/^# #//g"
}

# Tool welcome message :)
function welcome() {
        msg=" Bienvenue "
        marginLeft=$(repeatc "$(echo -e '\u00A0')" $(expr $(expr $(tput cols) - $(echo "$msg" | wc -c) ) / 2 ) )
        echo -e "\n$marginLeft\033[3;38;2;255;215;0m$msg \033[0m\n"
}

# Tool greetings :)
function greetings() {
        greetings_ascii_art
        welcome
        containers
}
