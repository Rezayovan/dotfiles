#!/bin/bash

languages=`echo "python cpp haskell typescipt nodejs" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk read" | tr ' ' '\n'`
selected=`printf "$languages\n$core_utils" | fzf`
read -p "query: " query

if printf "$languages" | grep -qs $selected; then
    tmux split-window -h  bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less"
else
    tmux split-window -h  bash -c "curl cht.sh/$selected~$query | less"
fi
