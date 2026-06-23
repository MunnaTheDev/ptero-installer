#!/bin/bash

clear
echo "=================================="
echo "  NEXT LEVEL PTERO INSTALLER"
echo "=================================="

echo "1) Panel install"
echo "2) Wings install"
echo "3) Full install (recommended)"

read -p "Choose option: " opt

case $opt in
  1)
    bash panel.sh
    ;;
  2)
    bash wings.sh
    ;;
  3)
    bash panel.sh
    bash wings.sh
    ;;
  *)
    echo "Invalid option"
    ;;
esac
