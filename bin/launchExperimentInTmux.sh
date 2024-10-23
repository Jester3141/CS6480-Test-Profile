#!/bin/bash

tmux \
    new-session -d -s "experiment" '/local/repository/bin/activate5GCore.sh' \; \
    select-pane -T "5G Core" \; \
    set -g pane-border-status top \; \
    set -g pane-border-format "#{pane_title}" \; \
    setw -g mouse on \; \
	display-pane \; \


tmux \
    split-window -h -p 75 '/local/repository/bin/activateGoodGNodeB.sh' \; \
    select-pane -T "Good gNodeB" \; \
    split-window -h -p 63 '/local/repository/bin/activateGoodGNodeBStatsDumper.sh' \; \
    select-pane -T "Good gNodeB Stats Dumper" \; \
    split-window -h -p 50 '/local/repository/bin/activateIPerf3Server.sh' \; \
    select-pane -T "IPerf3Server" \; \
    split-window -v -f -p 66 '/local/repository/bin/activateUE1.sh' \; \
    select-pane -T "UE1" \; \
    split-window -h -p 66 '/local/repository/bin/activateUE1Ping.sh' \; \
    select-pane -T "UE1 - Ping" \; \
    split-window -h  -p 50 '/local/repository/bin/activateUE1IPerfClient.sh' \; \
    select-pane -T "UE1 - Iperf3Client" \; \
    split-window -v -f -p 50 '/local/repository/bin/stopServicesAndGatherResults.sh' \; \
    select-pane -T "Results Gatherer" \; \
	select-pane -L

echo -e "Experiment running in tmux.  You may attach to the session with the following command:"
echo -e ""
echo -e "tmux attach -t experiment"
echo -e ""
echo -e "Once runnign completes, the results will be in /results"

