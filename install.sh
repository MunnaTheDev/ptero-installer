#!/bin/bash

# Define absolute color vars
CLEAR_SCREEN="clear"
COLOR_CYAN="\e[36m"
COLOR_PURPLE="\e[35m"
COLOR_GREEN="\e[32m"
COLOR_WHITE="\e[97m"
COLOR_RED="\e[31m"
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
    printf "${BG_PURPLE}${COLOR_WHITE} ⧉ 10 minutes ${COLOR_RESET}  "
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
    printf "                  ${COLOR_WHITE}MUNNA EDITION — OBSIDIAN NEXT GEN${COLOR_RESET}\n"
    printf "─────────────────────────────────────────────────────────────────\n\n"

    # 3. Stats section
    printf " ❖ SYSTEM STATUS\n"
    printf "    CPU Usage:  ${COLOR_CYAN}1%%${COLOR_RESET}    RAM Usage:  ${COLOR_CYAN}4%%${COLOR_RESET}    Network:  ${COLOR_GREEN}● CONNECTED${COLOR_RESET}\n\n"

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
            # --- PANEL SUB-MENU (Matches the screenshot layout) ---
            while true; do
                $CLEAR_SCREEN
                printf "┌────────────────────────────────────────────────────────┐\n"
                printf "│ 🚀 ${COLOR_CYAN}SERVER PANEL MANAGER v15.0${COLOR_RESET}         00:56 │        │\n"
                printf "└────────────────────────────────────────────────────────┘\n"
                printf "${COLOR_CYAN}SYSTEM STATUS${COLOR_RESET}\n"
                printf " └── Uptime : 10 minutes\n"
                printf " └── Load   : 0.03\n"
                printf "──────────────────────────────────────────────────────────\n"
                printf " ⧉ AVAILABLE DEPLOYMENTS\n"
                printf "┌──────────────────────────────┬─────────────────────────┐\n"
                printf "│ [1] ${COLOR_PURPLE}Ptero${COLOR_RESET}                    │ [7]  ${COLOR_PURPLE}Convoy${COLOR_RESET}            │\n"
                printf "│ [2] ${COLOR_PURPLE}Jexactyl${COLOR_RESET}                 │ [8]  ${COLOR_PURPLE}FeatherPanel${COLOR_RESET}      │\n"
                printf "│ [3] ${COLOR_PURPLE}JexPanel${COLOR_RESET}                 │ [9]  ${COLOR_PURPLE}Mythicaldash${COLOR_RESET}      │\n"
                printf "│ [4] ${COLOR_PURPLE}Reviactyl${COLOR_RESET}                │ [10] ${COLOR_PURPLE}Mythicaldashv3${COLOR_RESET}    │\n"
                printf "│ [5] ${COLOR_PURPLE}CtrlPanel${COLOR_RESET}                │ [11] ${COLOR_PURPLE}VPS Panel${COLOR_RESET}         │\n"
                printf "│ [6] ${COLOR_PURPLE}Paymenter${COLOR_RESET}                │ [${COLOR_RED}0${COLOR_RESET}]  Exit               │\n"
                printf "└──────────────────────────────┴─────────────────────────┘\n\n"
                printf "λ Select Module [1-11]: "
                
                read -r panel_choice
                
                case $panel_choice in
                    0)
                        # Exit sub-menu and go back to main menu
                        break
                        ;;
                    1|2|3|4|5|6|7|8|9|10|11)
                        printf "\n${COLOR_CYAN}🔧 Coming Soon...${COLOR_RESET}\n"
                        sleep 2
                        ;;
                    *)
                        printf "\n${BG_RED} Invalid Option! Try again. ${COLOR_RESET}\n"
                        sleep 1.5
                        ;;
                 Wharton esac
            done
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
