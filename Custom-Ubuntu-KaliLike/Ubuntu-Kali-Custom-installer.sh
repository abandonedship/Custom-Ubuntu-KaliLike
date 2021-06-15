#!/bin/bash

if [ $(id -u) == "0" ];
then
        printf "\e[0;31mIMPORTANT NOTE: \n"
        printf "gsettings will NOT work as sudo or root\n"
        printf "RUN THIS PROGRAM AS NORMAL USER AND IT WILL WORKS\e[0m\n\n"
        printf "From your local user $SUDO_USER type bash custom-dock.sh\n"
        exit
fi


########## DOCK #####################################################################################################################

printf "[\e[0;32m+\e[0m] Customizing dock\n"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 40
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity '0'
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items false
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop']"
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/matt-mcnulty-nyc-2nd-ave.jpg'
printf "Done.\n"

####################################################################################################################################


############### FONT AND THEME ###########################################################################

sudo su root -c "cp -r font-bitstream-vera /usr/share/fonts/truetype/vera-custom/"
printf "[\e[0;32m+\e[0m] New font Bitstream Vera added\n"
printf "\e[0;33mWARNING! To select terminal font open terminal,right click, preferences\e[0m\n"
gsettings set org.gnome.desktop.interface font-name 'vera-custom Bitstream Vera Sans Roman 10'
gsettings set org.gnome.shell.extensions.desktop-icons icon-size small

sudo su root -c "cp -r Kali-Dark /usr/share/themes/"
printf "[\e[0;32m+\e[0m] New theme Kali-Dark added\n"
gsettings set org.gnome.desktop.interface gtk-theme 'Kali-Dark'

##########################################################################################################


########## ICONS FLAT-REMIX-BLUE-DARK ################################################################################################################

printf "Need root password just to copy from Flat-Remix-Blue-Dark to /usr/share/icons\n"
sudo su root -c 'printf "[\e[0;32m+\e[0m] Copying Flat-Remix-Blue-Dark to /usr/share/icons/\n" && cp -r $PWD/Flat-Remix-Blue-Dark /usr/share/icons/'
gsettings set org.gnome.desktop.interface icon-theme 'Flat-Remix-Blue-Dark'
printf "Reboot system to apply changes in desktop icons\n"

######################################################################################################################################################
