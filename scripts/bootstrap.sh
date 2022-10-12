#!/bin/bash -e
#Os Update & Upgrade
sudo apt-get update
sudo apt-get install apt-transport-https wget curl net-tools nano -y
sudo apt-get upgrade -y

# Configure timezone and locale
sudo timedatectl set-timezone "Europe/Istanbul"
date
sudo bash -c "
sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
sed -i -e 's/# tr_TR.UTF-8 UTF-8/tr_TR.UTF-8 UTF-8/' /etc/locale.gen && \
echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
dpkg-reconfigure --frontend=noninteractive locales && \
update-locale LANG=en_US.UTF-8"
