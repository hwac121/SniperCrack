#!/bin/bash


# Title: SniperCrack wifi pentesting
# Version: 1.0
# Author: RJ Levesque, Jr. - Majik Cat Security
# Contact: hwac121@torbox.onion
# GitHub: https://github.com/hwac121

#-----------------------------------------------------------------

# Description:
# SniperCrack is used to find, choose, and snatch a handshake from 
# a network AP and it's connecting client. Do not use on a network 
# without explicit permission as this would be illegal. This software 
# was designed strictly for pentesting and educational purposes only.
# The author is not responsible for any abuse of this program by the
# end-user.

#=================================================================
#                         CHECK FOR ROOT
#=================================================================

if [ "$EUID" -ne 0 ]
  then echo "\e[31mPlease run as root or sudo ./install-scrack.sh\e[0m"
  exit
fi

clear
    figlet "SniperCrack"

#=================================================================
#                     CHECK FOR REQUIREMENTS
#=================================================================

##############################
#  CHECKING FOR AIRCRACK-NG  #
##############################
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' aircrack-ng | grep "install ok installed")
echo Checking for aircrack-ng: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "aircrack-ng not installed. Attempting to install aircrack-ng now..."
  sleep 0.15
  sudo apt-get install aircrack-ng
fi

#######################
#  CHECKING FOR MDK4  #
#######################
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' mdk4 | grep "install ok installed")
echo Checking for mdk4: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "mdk4 not installed. Attempting to install mdk4 now..."
  sleep 0.15
  sudo apt-get install mdk4
fi

#########################
#  CHECKING FOR CRUNCH  #
#########################
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' crunch | grep "install ok installed")
echo Checking for crunch: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "crunch not installed. Attempting to install crunch now..."
  sleep 0.15
  sudo apt-get install crunch
fi

#######################
#  CHECKING FOR WASH  #
#######################
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' wash | grep "install ok installed")
echo Checking for wash: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "wash not installed. Attempting to install wash now..."
  sleep 0.15
  sudo apt-get install wash
fi

#=================================================================
#            INSTALLING MAIN PROGRAM AND MAKING GLOBAL
#=================================================================

echo -e " "
echo -e "Making Snatch available globally..."
sudo cp SniperCrack.sh /usr/bin/snipercrack
sleep 0.15
echo -e " "
echo -e "Copying files to correct positions..."
sudo chmod +x /usr/bin/snipercrack
sleep 0.15
echo -e " "
echo -e "Setting proper permissions..."
sudo chmod +x SniperCrack.sh
sleep 0.15

#=================================================================
#                    INSTALLATION COMPLETION
#=================================================================

echo -e "Be sure to checkout the stand-alone software [TX Power Blast v2.0] to boost your wifi antenna."
echo -e "Available on GitHub at: https://github.com/hwac121"
sleep 4
clear
echo -e "Installation complete!"
sleep 2
clear
sudo ./SniperCrack.sh
