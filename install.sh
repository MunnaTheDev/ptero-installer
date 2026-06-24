#!/bin/bash

# Define Colors for UI styling
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
RED_BG='\033[41m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

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

while true; do
    show_menu
    read -r choice
    
    case $choice in
        1)
            echo "Installing VPS options..."
            # Insert your logic or trigger another script here
            sleep 2
            ;;
        2)
            echo "Setting up Control Panel..."
            sleep 2
            ;;
        0)
            echo "Shutting down system..."
            exit 0
            ;;
        *)
            echo -e "${RED_BG}Invalid Option!${NC}"
            sleep 1
            ;;
    esac
done
