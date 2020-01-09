#!/bin/bash
function open_workspace(){
  for f in `seq 1 4 `; do
    case $f in
      1)
        tmux split-window -h -t $1
        tmux send-keys -t $1:1 fluxx Enter
        tmux send-keys -t $1:1 bes Enter
        tmux select-layout -t $1 even-horizontal
        ;;
      2)
        tmux split-window -h -t $1
        tmux send-keys -t $1:1 fluxx Enter
        tmux send-keys -t $1:1 que Enter
        tmux select-layout -t $1 even-horizontal
        ;;
      3)
        tmux split-window -h -t $1
        tmux send-keys -t $1:1 fluxx Enter
        tmux send-keys -t $1:1 dyn Enter
        tmux select-layout -t $1 even-horizontal
        ;;
      4)
        tmux split-window -v -t $1
        tmux send-keys -t $1:1 es Enter
        ;;
      *)
        echo Thats All
        ;;
    esac
  done
}

function set_requirement(){
  base_session='my_work_space'
  session_name=$base_session
  tmux new-session -d -s $base_session
  tmux -2 attach-session -t $session_name >/dev/null 2>&1
  open_workspace $base_session
  tmux new-window -t $session_name:2
  tmux send-keys -t $session_name:2 fluxx Enter
  tmux send-keys -t $session_name:2 'vim .' Enter
}

set_requirement
