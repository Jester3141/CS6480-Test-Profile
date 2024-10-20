#!/bin/bash
set -e

# bring in common functions
. activateFunctions.sh


# ensure we are ready to run the 4G gNodeB
CheckFor4gGNBSetup






# start the Evil gNodeB
sudo gnb -c /etc/srsran/gnb_good.conf
