#!/bin/bash

# ensure we are ready to run the 5G core
sudo ./deploy-srs.sh release_24_04 srsRAN_Project

# ensure we are ready to run the 4G gNodeB
sudo ./deploy-srs.sh release_23_11 srsRAN_4G


# install other components
sudo apt install -y python3-pip
sudo pip install ruamel.yaml


# create a network namespace for the UE(s)
sudo ip netns add ue1 || true
sudo ip netns add ue2 || true
sudo ip netns add ue3 || true
sudo ip netns add ue4 || true



##############################################################
# setup the good gNodeB config file

# copy the existing gnb conf file to a new one
sudo cp /etc/srsran/gnb.conf /etc/srsran/gnb_good.conf

# Modify the good config file to report statistics
sudo ./modifyGnbConfig.py -f /etc/srsran/gnb_good.conf --metricsIpAddr 127.0.0.1 --metricsPort 55555


##############################################################
# setup the EVIL gNodeB config file

# copy the existing gnb conf file to a new one
sudo cp /etc/srsran/gnb.conf /etc/srsran/gnb_evil.conf

# Modify the good config file to report statistics
sudo ./modifyGnbConfig.py -f /etc/srsran/gnb_evil.conf --metricsIpAddr 127.0.0.1 --metricsPort 55556 --testMode
