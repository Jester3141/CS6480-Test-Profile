#!/bin/bash

tmux \
    new-session  '/local/repository/bin/activate5GCore.sh' \; \
    split-window -h -p 75 '/local/repository/bin/activateGoodGNodeB.sh' \; \
    split-window -h -p 63 '/local/repository/bin/activateGoodGNodeBStatsDumper.sh' \; \
    split-window -h -p 50 '/local/repository/bin/activateIPerf3Server.sh' \; \
    split-window -v -f -p 66 '/local/repository/bin/activateUE1.sh' \; \
    split-window -h -p 66 '/local/repository/bin/activateUE1Ping.sh' \; \
    split-window -h  -p 50 '/local/repository/bin/activateUE1IPerfClient.sh' \; \
    split-window -v -f -p 50 '/local/repository/bin/stopServicesAndGatherResults.sh' \; \
	select-pane -L

