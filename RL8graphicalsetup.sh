#!/bin/bash
yes | sudo dnf update
yes | sudo dnf upgrade
yes | sudo dnf install epel-release
yes | sudo dnf config-manager --set-enabled powertools
yes | sudo dnf copr enable stenstorp/lightdm
yes | sudo dnf upgrade
yes | sudo dnf groupinstall "xfce"
yes | sudo dnf install lightdm
sudo systemctl disable gdm
sudo systemctl enable lightdm
sudo systemctl set-default graphical.target
read -e -p "would you like to reboot? y\n:" REB
case $REB in
   y|Y)
     reboot
   ;;
   N|n)
     echo "please reboot to complete setup of graphical enviroment"
   ;;
esac
