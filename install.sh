#!/bin/bash

CLEAR_SCREEN="clear"

COLOR_CYAN="\e[36m"
COLOR_PURPLE="\e[35m"
COLOR_GREEN="\e[32m"
COLOR_WHITE="\e[97m"
COLOR_RED="\e[31m"
COLOR_YELLOW="\e[33m"

BG_RED="\e[41m"
BG_BLUE="\e[44m"
BG_RESET="\e[0m"
COLOR_RESET="\e[0m"

STATUS_FILE="/tmp/ptero_status"

get_uptime_text() {
    uptime_seconds=$(awk '{print int($1)}' /proc/uptime)
    minutes=$((uptime_seconds / 60))

    if [ $minutes -lt 60 ]; then
        echo "$minutes minutes"
    else
        hours=$((minutes / 60))
        mins=$((minutes % 60))
        echo "$hours h $mins m"
    fi
}

install_ptero() {
    echo "INSTALLING" > "$STATUS_FILE"

    clear
    echo -e "${COLOR_CYAN}Installing Pterodactyl...${COLOR_RESET}"
    sleep 1

    apt update -y && apt upgrade -y
    apt install -y curl wget git sudo

    # OFFICIAL installer (stable & real)
    bash <(curl -fsSL https://pterodactyl-installer.se)

    if [ -d "/var/www/pterodactyl" ]; then
        echo "INSTALLED" > "$STATUS_FILE"
        echo -e "${COLOR_GREEN}INSTALLED SUCCESSFULLY${COLOR_RESET}"
    else
        echo "FAILED" > "$STATUS_FILE"
        echo -e "${COLOR_RED}INSTALL FAILED${COLOR_RESET}"
    fi

    sleep 2
}

while true; do
    $CLEAR_SCREEN

    STATUS="NOT INSTALLED"
    [ -f "$STATUS_FILE" ] && STATUS=$(cat "$STATUS_FILE")

    if [ "$STATUS" = "INSTALLED" ]; then
        ST="${COLOR_GREEN}INSTALLED ✓${COLOR_RESET}"
    elif [ "$STATUS" = "FAILED" ]; then
        ST="${COLOR_RED}FAILED ✗${COLOR_RESET}"
    elif [ "$STATUS" = "INSTALLING" ]; then
        ST="${COLOR_YELLOW}INSTALLING...${COLOR_RESET}"
    else
        ST="${COLOR_RED}NOT INSTALLED${COLOR_RESET}"
    fi

    echo -e "${BG_BLUE}${COLOR_WHITE} MUNNA PANEL ${COLOR_RESET}"
    echo ""
    echo -e "PTERO STATUS: $ST"
    echo ""
    echo "1) Install Pterodactyl"
    echo "2) Exit"
    echo ""

    read -p "Select: " opt

    case $opt in
        1)
            install_ptero
            read -p "Press Enter..."
            ;;
        2)
            exit 0
            ;;
        *)
            echo -e "${COLOR_RED}Invalid${COLOR_RESET}"
            sleep 1
            ;;
    esac
done
