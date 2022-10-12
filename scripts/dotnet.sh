#!/bin/bash -e
# Install .netCore
export DEBIAN_FRONTEND=noninteractive
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install dotnet-sdk-3.1 -y
sudo apt-get autoremove -y