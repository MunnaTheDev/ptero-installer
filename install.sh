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

# Function to calculate VPS uptime in HH:MM format dynamically
get_vps_timer() {
    local uptime_seconds
    uptime_seconds=$(awk '{print int($1)}' /proc/uptime 2>/dev/null)
    
    if [ -z "$uptime_seconds" ]; then
        printf "00:00"
        return
    fi

    local hours=$((uptime_seconds / 3600))
    local minutes=$(((uptime_seconds % 3600) / 60))
    printf "%02d:%02d" $hours $minutes
}

# Function to get uptime text for system status (e.g., "10 minutes")
get_uptime_text() {
    local uptime_seconds
    uptime_seconds=$(awk '{print int($1)}' /proc/uptime 2>/dev/null)
    
    if [ -z "$uptime_seconds" ]; then
        printf "Unknown"
        return
    fi

    local minutes=$((uptime_seconds / 60))
    if [ $minutes -lt 60 ]; then
        printf "%d minutes" $minutes
    else
        local hours=$((minutes / 60))
        local remaining_minutes=$((minutes % 60))
        printf "%d hours, %d mins" $hours $remaining_minutes
    fi
}

while true; do
    $CLEAR_SCREEN
    CURRENT_UPTIME=$(get_uptime_text)
    VPS_TIMER=$(get_vps_timer)
    
    # 1. Top Badges Row
    printf "${BG_BLUE}${COLOR_WHITE} ⧉ root ${COLOR_RESET}  "
    printf "${BG_PURPLE}${COLOR_WHITE} ⧉ ${CURRENT_UPTIME} ${COLOR_RESET}  "
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
        1|3|4|5|6|7|8|9)
            printf "\n${COLOR_CYAN}🔧 Coming Soon...${COLOR_RESET}\n"
            sleep 2
            ;;
        2)
            # --- PANEL SUB-MENU ---
            while true; do
                $CLEAR_SCREEN
                CURRENT_UPTIME=$(get_uptime_text)
                VPS_TIMER=$(get_vps_timer)
                
                printf "┌────────────────────────────────────────────────────────┐\n"
                printf "│ 🚀 ${COLOR_CYAN}SERVER PANEL MANAGER v15.0${COLOR_RESET}         ${VPS_TIMER} │        │\n"
                printf "└────────────────────────────────────────────────────────┘\n"
                printf "${COLOR_CYAN}SYSTEM STATUS${COLOR_RESET}\n"
                printf " └── Uptime : ${CURRENT_UPTIME}\n"
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
                        break
                        ;;
                    1)
                        # --- PTERODACTYL SUB-MENU WITH DYNAMIC STATUS ---
                        while true; do
                            $CLEAR_SCREEN
                            printf "${COLOR_PURPLE}"
                            printf " ___  _                     _              _   _ _ \n"
                            printf "|  _ \ sketch _ ___ _ _  __| | ___ _  ___ | |_| | |\n"
                            printf "| |_) |  _/ _ \  _ \ ' \/ _\` |/ _ \ |/ _ \|  _|_| |\n"
                            printf "|  __/| ||
