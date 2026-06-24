#!/bin/bash

# Clear the terminal screen
clear

# Define UI Colors
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
RED_BG='\033[41m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Function to draw the visual menu
show_menu() {
    clear
    echo -e "${CYAN}⧉ DEPLOYMENT & SERVICES${NC}"
    echo -e " ├── [1] VPS           ├── [5] Themes"
    echo -e " ├── [2] Panel         ├── [6] System"
    echo -e " ├── [3] Wings         ├── [7] Container"
    echo -e " └── [8] ${GREEN}New Module${NC}"
    echo ""
    echo -e "${PURPLE}⧉ MAINTENANCE & TOOLS${NC}"
    echo -e " ├── [4] Toolbox       └── ${RED_BG}${WHITE} [0] SHUTDOWN SYSTEM ${NC}"
    echo -e " └── [9] Extras"
    echo "──────────────────────────────────────────────"
    echo -n "➔ Enter Option (0-9): "
}

# Infinite loop to keep menu open until exit
while true; do
    show_menu
    read -r choice
    
    case $choice in
        1)
            echo "Running VPS configuration..."
            sleep 2
            ;;
        2)
            echo "Running Panel configuration..."
            sleep 2
            ;;
        3)
            echo "Running Wings configuration..."
            sleep 2
            ;;
        0)
            echo "Exiting system script..."
            exit 0
            ;;
        *)
            echo -e "\n${RED_BG} Invalid Option! Try again. ${NC}"
            sleep 1.5
            ;;
    esac
done
