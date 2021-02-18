#!/bin/sh

configDir=$HOME/.config/
rootDir=$HOME/
path=$(realpath "$0")
dir=$(dirname "$path")
configDirs=("termite" "i3" "polybar" "mopidy" "gtk-3.0" "opera" "ncmpcpp") 
rootDirs=("git" "vim" "bash" "x")
rootFiles=$(find $rootDirs -type f | awk -F/ '{print $2}')
configFiles=$(find $configDirs -type f) 
backupDir=${rootDir}dotfiles.old

helpFunction()
{
   echo ""
   echo "Usage: $0 [options]"
   echo ""
   echo "OPTIONS"
   echo ""
   echo -e "\t-h Display this help"
   echo -e "\t-u Uninstall dot files"
   exit 1
}

install()
{
    cd $dir
    echo "Installing..."
    for appDir in ${rootDirs[@]}; do
        stow -v -t $rootDir $appDir
    done
    for appDir in ${configDirs[@]}; do
        stow -v -t ${configDir}${appDir} ${appDir}
    done
    echo "Done."
}

backup()
{
    echo "Backing up..."
    mkdir -p ${backupDir}
    cd $dir
    for file in ${configFiles[@]}; do
        cp -vrL ${configDir}$file ${backupDir}
        rm -vrf ${configDir}$file
    done
    for file in ${rootFiles[@]}; do
        cp -vrL ${rootDir}$file ${backupDir}
        rm -vrf ${rootDir}$file
    done
    echo "Done."
}

rollback()
{
    echo "Rolling back..."
    cd $backupDir
    for file in ${configFiles[@]}; do
        cp -r $file ${configDir}$file
    done
    for file in ${rootFiles[@]}; do
        cp -r $file ${rootDir}$file
    done
    cd $rootDir && rm -vrf $backupDir
    echo "Done."
}

uninstall()
{
    cd $dir
    echo "Uninstall in progress..."
    for appDir in ${rootDirs[@]}; do
        stow -v -D ${appDir} -t ${rootDir}
    done
    for appDir in ${configDirs[@]}; do
        stow -v -D ${appDir} -t ${configDir}${appDir}
    done
    echo "Done."
}

while getopts "hu" opt
do
   case "$opt" in
      h ) helpFunction ;;
      u ) uninstall ;;
      * ) helpFunction ;;
   esac
done


if (($OPTIND == 1)); then
    backup
    install
fi

#stow -t ~ git vim bash x
#stow -t ~/.config/termite termite 
#stow -t ~/.config/i3 i3
#stow -t ~/.config/polybar polybar
#stow -t ~/.config/mopidy mopidy
#stow -t ~/.config/gtk-3.0 gtk-3.0
#stow -t ~/.config/opera opera
#stow -t ~/.config/ncmpcpp ncmpcpp
