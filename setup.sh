sudo docker build -t dock2 ./docker/ssh_container/
ssh-keygen -t rsa -b 2048 -C "jerrygems" -N "jerrygems@private"
ssh-keygen -t rsa -b 2048 -C "ansible" -N ""
tmux set -g mouse on
tmux split-window -h
tmux select-pane -t 0
tmux split-window -p 20 -v
tmux select-pane -t 2
tmux split-window -v
tmux send-keys -t 0 "clear;neofetch" C-m
tmux send-keys -t 1 "cava" C-m
tmux send-keys -t 2 "clear;sudo docker run -it dock2" C-m
tmux send-keys -t 3 "clear;sudo docker run -it dock2" C-m

# copying the public keys to the hosts so that connection becomes easier
ssh-copy-id -i ~/.ssh/id_rsa.pub root@172.17.0.2
ssh-copy-id -i ~/.ssh/ansible.pub root@172.17.0.3
