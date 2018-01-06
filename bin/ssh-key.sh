#!/usr/bin/env bash

# Print public SSH key to clipboard. Generate it if necessaryile="$HOME/.ssh/id_rsa.pub"
if [ ! -f "$file"  ]; then
  ssh-keygen -t rsa
fi

pbcopy < ~/.ssh/id_rsa.pub
