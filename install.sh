#!/bin/bash

# Define UI Colors
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
RED_BG='\033[41m'
WHITE='\033[1;37m'
BLUE_BG='\033[44m'
NC='\033[0m' # No Color

show_menu() {
    clear
    # Top Status Badges
    echo -e "${BLUE_BG}${WHITE} ⧉ root ${NC}  ${PURPLE} ⧉ 6 minutes ${NC}  ${GREEN} ⧉ 7% ${NC}  ${CYAN} ⧉ 1% RAM 4% ${NC}"
    echo ""
    
    # Your Custom Name Banner (Cyan color matches the original vibe)
    echo -e "${CYAN}"
    echo "    __  ___                      _ ___          ____              "
    echo "   /  |/  /_  ______  ____  ____| /   |  ____  / __ \___ _   __  "
    echo "  / /|_/ / / / / __ \/ __ \/ __  / /| | / __ \/ / / / _ \ | / /  "
    echo " / /  / / /_/ / / / / / / / /_/ / ___ |/ / / / /_/ /  __/ |/ /   "
    echo "/_/  /_/\__,_/_/ /_/_/ /_/\__,_/_/  |_/_/ /_/_____/\___/|___/    "
    echo -e "${NC}"
    echo -e "                 ${WHITE}MUNNA EDITION — OBSIDIAN NEXT GEN${NC}"
    echo "─────────────────────────────────────────────────────────────────"
    echo ""
    
    # System Status Mockup data
    echo -e " ❖ SYSTEM STATUS"
    echo -e "   CPU Usage:  ${CYAN}1%${NC}    RAM Usage:  ${CYAN}4%${NC}    Network:  ${GREEN}● CONNECTED${NC}"
    echo ""
    
    # Menu Grid Layout
    echo -e "${CYAN}⧉ DEPLOYMENT & SERVICES${NC}"
    echo -e " ├── [1] VPS           ├── [5] Themes"
    echo -e " ├── [2] Panel         ├── [6] System"
    echo -e " ├── [3] Wings         ├── [7] Container"
    echo -e " └── [8] ${GREEN}New Module${NC}"
    echo ""
    echo -e "${PURPLE}⧉ MAINTENANCE & TOOLS${NC}"
    echo -e " ├── [4] Toolbox       └── ${RED_BG}${WHITE} [0] SHUTDOWN SYSTEM ${NC}"
    echo -e " └── [9] Extras"
    echo "─────────────────────────────────────────────────────────────────"
    echo -n "➔ Enter Option (0-9): "
}

# Keep script alive to test layout
while true; do
    show_menu
    read -r choice
    case $choice in
        0) echo "Exiting..."; exit 0 ;;
        *) echo -e "\n Option selected." ; sleep 1 ;;
    esac
done
