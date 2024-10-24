#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/activateFunctions.sh

# ensure we are ready to run the 4G gNodeB
sudo ./deploy-srs.sh release_23_11 srsRAN_4G


# install other components
sudo apt install -y python3-pip
sudo pip install ruamel.yaml jsonstream matplotlib



#############################################
# Create the results folder
sudo mkdir -p ${RESULTS_FOLDER}
sudo chmod a+rwx ${RESULTS_FOLDER}
sudo mkdir -p ${RESULTS_FOLDER}/data/
sudo chmod a+rwx ${RESULTS_FOLDER}/data/
sudo mkdir -p ${RESULTS_FOLDER}/roughData/
sudo chmod a+rwx ${RESULTS_FOLDER}/roughData/


sudo echo -e "$1" > /UENUM


##############################################################
# setup the UE(s)'s' config file
echo "Writing modified UE files to /etc/srsran/   (turning on json logging)"
for i in {1..4}
do
    cp /etc/srsran/ue.conf /tmp/ue${i}.conf
    echo "[general]"                                                               >> /tmp/ue${i}.conf
    echo "metrics_json_enable   = true"                                            >> /tmp/ue${i}.conf
    echo "metrics_json_filename = ${RESULTS_FOLDER}/roughData/UE${i}_metrics.json" >> /tmp/ue${i}.conf
    sudo cp /tmp/ue${i}.conf /etc/srsran/
done



