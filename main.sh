#!/bin/bash
echo "yes"
function open_workspace(){
  echo are you the one
  for f in `seq 1 2`; do
    tmux split-window -h -t $1
    tmux send-keys -t $1:1 fluxx Enter
    tmux select-layout -t $1 even-horizontal
  done
}

#if [ -z "$TMUX"  ]; then
echo what is wrong
base_session='my_work_space'
# Create a new session if it doesn't exist
tmux has-session -t $base_session || tmux new-session -d -s $base_session
# Are there any clients connected already?
client_cnt=$(tmux list-clients | wc -l)
if [ $client_cnt -ge 1  ]; then
  echo i got here again
  session_name=$base_session"-"$client_cnt
  tmux new-session -d -t $base_session -s $session_name
  echo i got here again
  tmux -2 attach-session -t $session_name
  open_workspace $base_session
  tmux new-window -t $session_name:2
  tmux send-keys -t $session_name:2 vim Enter
else
  echo I stooped here
  tmux -2 attach-session -t $base_session
  open_workspace $base_session
fi
#fi



# tmux detach-client
# tmux attach-session -t my_work_space
