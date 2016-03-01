#!/bin/bash
source password.sh

sudo apt-get update
# we need some extra packages
sudo apt-get -y install git autoconf libtool libconfuse-dev libarchive-dev
#the following is for fwup
# add libsodium ppa
yes | sudo add-apt-repository ppa:chris-lea/libsodium
sudo apt-get update
# install libsodium-dev
sudo apt-get -y install libsodium-dev
# install fwup
git clone https://github.com/fhunleth/fwup.git
cd fwup
git checkout tags/v0.6.0
./configure && make
echo $PASSWORD | sudo -S make install

#============UNTESTED====================#
sed -i "4i default_target :rpi2" test.txt


echo "-------------------------------------------------------------------------"
echo "--> Provisioning Nerves::Blinky Virtual Machine"
echo "-------------------------------------------------------------------------"
echo "--> apt-get updating"
sudo apt-get -y update > /dev/null 2>&1

echo "--> Nerves::Blinky Virtual Machine provisioned"
echo "-------------------------------------------------------------------------"
echo "--> Build stuff!"
echo "-------------------------------------------------------------------------"
