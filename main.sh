#!/bin/bash
function open_workspace(){
  for f in `seq 1 2`; do
    tmux split-window -h -t $1
    tmux send-keys -t $1:1 fluxx Enter
    tmux select-layout -t $1 even-horizontal
  done
}

#if [ -z "$TMUX"  ]; then
base_session='my_work_space'
# Create a new session if it doesn't exist
tmux has-session -t $base_session || tmux new-session -d -s $base_session
# Are there any clients connected already?
client_cnt=$(tmux list-clients | wc -l)
session_name=$base_session
if [ $client_cnt -ge 1  ]; then
  echo "this is me"
  tmux new-session -d -t $base_session
  tmux attach-session -t $session_name
  open_workspace $base_session
  tmux new-window -t $session_name:2
  tmux send-keys -t $session_name:2 fluxx Enter
  tmux send-keys -t $session_name:2 vim Enter
else
  tmux -2 attach-session -t $base_session
  open_workspace $base_session
  tmux new-window -t $base_session:2
  tmux send-keys -t $base_session:2 fluxx Enter
  tmux send-keys -t $base_session:2 vim Enter
fi
#fi



# tmux detach-client
# tmux attach-session -t my_work_space
