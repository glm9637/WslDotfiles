This repository contains my custom setup and configuration for wsl

# Setup

## Setting up github

1.  run the following command(replace the email):
    1.      ssh-keygen -t ed25519 -C "email@example.com" -f ~/.ssh/github && cat ~/.ssh/github.pub
2.  login to github, create a new key and copy the last line of the previous output
3.  Run the following commands to add the key to the ssh agent
    1.      eval `ssh-agent -s`
    2.      ssh-add ~/.ssh/github
4.  clone and rename the repository
    1.      git clone https://github.com/glm9637/WslDotfiles
    2.     mv WslDotfiles dotfiles
5.  Run the makefile:
    1.     cd dotfiles
    2.     make
6.  Done!
