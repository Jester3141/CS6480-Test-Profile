#!/bin/bash
echo -e "UE2"
set -e

# bring in common functions
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/activateFunctions.sh

echo ""
echo "Sleeping for ${UE2_STARTUP_DELAY} seconds to allow the 5G core and GNB to start"
echo ""
sleep ${UE2_STARTUP_DELAY}

if [ -f ${RESULTS_FOLDER}/roughData/UE2_metrics.jsons ]; then
    sudo rm -f ${RESULTS_FOLDER}/roughData/UE2_metrics.json
fi

# start the UE2
sudo srsue /etc/srsran/ue2.conf