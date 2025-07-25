#!/bin/bash

# Colores ANSI
greenColour="\033[1;32m"
endColour="\033[0m"
redColour="\033[1;31m"
blueColour="\033[1;34m"
yellowColour="\033[1;33m"
purpleColour="\033[1;35m"
cyanColour="\033[1;36m"
grayColour="\033[1;37m"

echo -e "${cyanColour}"
echo ""
echo " __  ___                                           _           "
echo " \ \/ / |_ _ __ ___ _ __ ___   ___    ___ ___   __| | ___ _ _____ "
echo "  \  /| __| '__/ _ \ '_ \` _ \ / _ \  / __/ _ \ / _\` |/ _ \ '__|"
echo "  /  \| |_| | |  __/ | | | | |  __/ | (_| (_) | (_| |  __/ |   "
echo " /_/\_\\__|_|  \___|_| |_| |_|\___|  \___\___/ \__,_|\___|_|   "
echo ""
echo -e "                                                                 ${grayColour}made by xk4libur${endColour}"
echo ""

# Menú principal: encode or decode
echo -e "${yellowColour}Do you want to encode or decode your message?${endColour}"
echo -e "\n${greenColour}1) Encode${endColour}"
echo -e "${greenColour}2) Decode${endColour}\n"
read -p "Enter your choice: " action

if [[ "$action" == "1" ]]; then
  echo -e "${yellowColour}[+] Choose an encoding option:${endColour}"
  echo -e "${greenColour}1) Base64${endColour}"
  echo -e "${greenColour}2) Hexadecimal${endColour}"
  echo -e "${greenColour}3) Binary${endColour}\n"
  read -p "Enter your choice: " option
  echo -ne "\n${yellowColour}Give me your message to encode: ${endColour}"
  read name

  case $option in
    1) echo -ne "\nYour message encoded is: ${greenColour}$(echo -n "$name" | base64)${endColour}\n" ;;
    2) echo -ne "\nYour message encoded is: ${greenColour}$(echo -n "$name" | xxd -p | tr -d '\n')${endColour}\n" ;;
    3) echo -ne "\nYour message encoded is: ${greenColour}$(echo -n "$name" | perl -lpe '$_=unpack("B*")')${endColour}\n" ;;
    *) echo -e "${redColour}Invalid encoding option${endColour}" ;;
  esac

elif [[ "$action" == "2" ]]; then
  echo -ne "\n${yellowColour}[+] Choose a decoding option:${endColour}\n"
  echo -e "${greenColour}1) Base64${endColour}"
  echo -e "${greenColour}2) Hexadecimal${endColour}"
  echo -e "${greenColour}3) Binary${endColour}\n"
  read -p "Enter your choice: " option
  echo -ne "\n${yellowColour}Give me your message to decode: ${endColour}"
  read name

  case $option in
    1) echo -ne "\nYour decoded message is: ${greenColour}$(echo -n "$name" | base64 --decode)${endColour}\n" ;;
    2) echo -ne "\nYour decoded message is: ${greenColour}$(echo -n "$name" | xxd -r -p)${endColour}\n" ;;
    3) echo -ne "\nYour decoded message is: ${greenColour}$(echo -n "$name" | perl -lpe '$_=pack("B*", $_)')${endColour}\n" ;;
    *) echo -e "${redColour}Invalid decoding option${endColour}" ;;
  esac

else
  echo -e "${redColour}Invalid choice. Please restart the script and select 1 or 2.${endColour}"
fi

echo -e "${endColour}\n"
