#!/bin/bash
mkdir prom; cd prom;
if [ ! -f "prometheus*.tar.gz" ]; then
  wget https://github.com/prometheus/prometheus/releases/download/v2.54.0/prometheus-2.54.0.linux-amd64.tar.gz
else
  tar xvf prometheus*.tar.gz
fi
cd ..
sudo docker build -t promql_node ./
tmux set -g mouse on
tmux split-window -h
tmux select-pane -t 1
tmux split-window -v -p 70
tmux select-pane -t 2
tmux split-window -v -p 50
tmux send-keys -t 1 "sudo docker run -it promql_node -p 3000:3000 -p 8000:8000 -p 9100:9100" C-m
tmux send-keys -t 2 "sudo docker run -it promql_node -p 3000:3000 -p 8000:8000 -p 9100:9100" C-m
tmux send-keys -t 3 "sudo docker run -it promql_node -p 3000:3000 -p 8000:8000 -p 9100:9100" C-m
tmux send-keys -t 0 "cd prom;tar -xvf prome*.tar.gz;rm *.tar.gz*;cd promet*" C-m
