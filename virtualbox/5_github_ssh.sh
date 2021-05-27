#!/bin/bash
if [ -z "$1" ]
then
    echo "\$1 is empty (requires email for github)"
else
  ssh-keygen -t ed25519 -C $1
  $ eval `ssh-agent -s`
  $ ssh-add ~/.ssh/id_ed25519
  echo "Copy key below and add to Github"
  cat ~/.ssh/id_ed25519
  echo "Copy key above ^^ and add to Github"
fi
