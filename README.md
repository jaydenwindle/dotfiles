# My dotfiles

This repo contains my dotfiles for quick environment setup. 

```bash
# install dependencies
sudo apt-get install git curl zsh vim tmux python-pip
pip install tmuxp

# clone repo
cd ~
git clone https://github.com/jaydenwindle/dotfiles.git && cd dotfiles

# run install script 
./install.sh
# exit oh-my-zsh after it installs

# Post install
(in vim): run :PlugInstall
(in tmux): run prefix + I 
```
