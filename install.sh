#!/bin/bash

# Define absolute color vars
CLEAR_SCREEN="clear"
COLOR_CYAN="\e[36m"
COLOR_PURPLE="\e[35m"
COLOR_GREEN="\e[32m"
COLOR_WHITE="\e[97m"
BG_RED="\e[41m"
BG_BLUE="\e[44m"
BG_PURPLE="\e[45m"
BG_GREEN="\e[42m"
BG_CYAN="\e[46m"
COLOR_RESET="\e[0m"

while true; do
    $CLEAR_SCREEN
    
    # 1. Top Badges Row
    printf "${BG_BLUE}${COLOR_WHITE} ⧉ root ${COLOR_RESET}  "
    printf "${BG_PURPLE}${COLOR_WHITE} ⧉ 6 minutes ${COLOR_RESET}  "
    printf "${BG_GREEN}${COLOR_WHITE} ⧉ 7%% ${COLOR_RESET}  "
    printf "${BG_CYAN}${COLOR_WHITE} ⧉ 1%% RAM 4%% ${COLOR_RESET}\n\n"

    # 2. ASCII Title Banner
    printf "${COLOR_CYAN}"
    printf "    __  ___                      _ ___          ____              \n"
    printf "   /  |/  /_  ______  ____  ____| /   |  ____  / __ \\\___ _   __  \n"
    printf "  / /|_/ / / / / __ \\/ __ \\/ __  / /| | / __ \\/ / / / _ \\ | / /  \n"
    printf " / /  / / /_/ / / / / / / / /_/ / ___ |/ / / / /_/ /  __/ |/ /   \n"
    printf "/_/  /_/\\__,_/_/ /_/_/ /_/\\__,_/_/  |_/_/ /_/_____/\\___/|___/    \n"
    printf "${COLOR_RESET}"
    printf "                 ${COLOR_WHITE}MUNNA EDITION — OBSIDIAN NEXT GEN${COLOR_RESET}\n"
    printf "─────────────────────────────────────────────────────────────────\n\n"

    # 3. Stats section
    printf " ❖ SYSTEM STATUS\n"
    printf "   CPU Usage:  ${COLOR_CYAN}1%%${COLOR_RESET}    RAM Usage:  ${COLOR_CYAN}4%%${COLOR_RESET}    Network:  ${COLOR_GREEN}● CONNECTED${COLOR_RESET}\n\n"

    # 4. Interactive Grid Items
    printf "${COLOR_CYAN}⧉ DEPLOYMENT & SERVICES${COLOR_RESET}\n"
    printf " ├── [1] VPS           ├── [5] Themes\n"
    printf " ├── [2] Panel         ├── [6] System\n"
    printf " ├── [3] Wings         ├── [7] Container\n"
    printf " └── [8] ${COLOR_GREEN}New Module${COLOR_RESET}\n\n"

    printf "${COLOR_PURPLE}⧉ MAINTENANCE & TOOLS${COLOR_RESET}\n"
    printf " ├── [4] Toolbox       └── ${BG_RED}${COLOR_WHITE} [0] SHUTDOWN SYSTEM ${COLOR_RESET}\n"
    printf " └── [9] Extras\n"
    printf "─────────────────────────────────────────────────────────────────\n"
    printf "➔ Enter Option (0-9): "
    
    read -r choice
    
    case $choice in
        1)
            printf "\nSetting up VPS...\n"
            sleep 2
            ;;
        2)
            printf "\nSetting up Panel...\n"
            sleep 2
            ;;
        3)
            printf "\nSetting up Wings...\n"
            sleep 2
            ;;
        0)
            printf "\nShutting down custom menu system. Goodbye!\n"
            exit 0
            ;;
        *)
            printf "\n${BG_RED} Invalid Option! Try again. ${COLOR_RESET}\n"
            sleep 1.5
            ;;
    esac
done
