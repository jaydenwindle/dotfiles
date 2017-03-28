#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
dependencies="git curl zsh vim tmux python-pip"    # list of files/folders to symlink in homedir
files="bashrc vimrc zshrc tmux.conf tmuxp.yaml vim tmux"    # list of files/folders to symlink in homedir
directories="vim vim/backup_files vim/swap_files vim/undo_files tmux"    # list of folders to create 

##########

# Install dependencies 
echo "Installing dependencies"
for dep in $dependencies; do
    echo "  $dep"
    sudo apt-get install $dep > /dev/null
done
echo -e "...done\n"


# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo -e "...done\n"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# create required directories
echo "Creating required directories:"
for d in $directories; do
    if [[ ! -d $d ]]; then
        echo "  Creating $d"
        mkdir $d
    fi
done
echo -e "...done\n"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
echo "Setting up dotfiles"
for file in $files; do
    if [ -d ~/.$file ] || [ -f ~/.$file ]; then 
        echo "  Move ~/.$file --> $olddir/$file"
        mv ~/.$file $olddir/$file
    fi
    echo "  Symlink ~/.$file --> $dir/$file"
    ln -s $dir/$file ~/.$file
done
echo -e "...done\n"

# install required plugins
echo "Installing plugins"
if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
    echo "  vim-plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > /dev/null
fi

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    echo "  tpm"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm > /dev/null
fi

if [[ ! -d ~/.oh-my-zsh ]]; then
    echo "  oh-my-zsh"
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    # move to dotfiles dir
    mv ~/.oh-my-zsh $dir/oh-my-zsh
    ln -s $dir/oh-my-zsh ~/.oh-my-zsh
    # deal with zshrc
    rm ~/.zshrc
    ln -s $dir/zshrc ~/.zshrc
fi
echo -e "...done\n"

echo "Everything should be set up. Go get 'em tiger!'"
