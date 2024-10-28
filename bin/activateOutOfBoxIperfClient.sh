#!/bin/bash
echo -e "UE1 - IPerf3 Client"
set -e

# bring in common functions
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
RESULTS_FOLDER=/root/results/

sudo mkdir -p ${RESULTS_FOLDER}
sudo chmod a+rwx ${RESULTS_FOLDER}

if [ -f ${RESULTS_FOLDER}/UE1_iperf_dl_results.jsons ]; then
    sudo rm -f ${RESULTS_FOLDER}/UE1_iperf_dl_results.json
fi

if [ -f ${RESULTS_FOLDER}/UE1_iperf_ul_results.jsons ]; then
    sudo rm -f ${RESULTS_FOLDER}/UE1_iperf_ul_results.json
fi

# start iperf3 client for UE1 and pass traffic on the downlink
echo "Starting IPerf3 Client.  Output is being redirected to file so you won't see anything. This is normal."
iperf3 -c 10.45.0.1 -R --json --logfile ${RESULTS_FOLDER}/UE1_iperf_dl_results.json &
sleep 2
iperf3 -c 10.45.0.1 -p 6201 --json --logfile ${RESULTS_FOLDER}/UE1_iperf_ul_results.json  &

# --json --logfile ${RESULTS_FOLDER}/roughData/UE1_iperf_results.json