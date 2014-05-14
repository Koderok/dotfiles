#!/bin/bash


dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc vim "    	  # list of files/folders to symlink in homedir


# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
	if [ -f ~/.$file ]; then
	        echo "Moving $file to $olddir"
	        mv ~/.$file ~/dotfiles_old/
	fi
	ln -s $dir/$file ~/.$file
done
