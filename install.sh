#!/bin/sh

echo "Installing Gitty..."
sudo cp -f gitty /usr/bin && sudo chmod +x /usr/bin/gitty
echo "Done."

if [ ! -e /usr/lib/node_modules ]
   then
      echo "\e[101m Gitty uses IPFS, which depends upon GoLang to work. Install Go? [Y/n] \e[0m"
      read insgo
      case $insgo in
         [nN])
            echo "Cannot install Gitty without its dependencies."
            exit;;
         [yY])
            echo "Sorry, but actually we can't install GoLang for you. Please search how to install Go. After installed, reply on this same script to install IPFS, and done"
            echo "\e[43m ;D \e[0m"
          # echo "Installing build dependencies..."
          # sudo apt-get install python g++ make # todo: detect different platforms, based on NodeJS build docs / also, do pre-compiled builds
          # echo "Extracting NodeJS..."
          # extract node.tar.gz / if not included, download from OS software repo
          # echo "Building NodeJS..."
          # cd include/node && chmod +x configure && ./configure | make -j4
            break ;;
         *)
            echo "Invalid answer." && exit
      esac
fi

# if [ ! -e /usr/lib/node_modules/dat ]
#    then
      echo "\e[101m Gitty depends upon IPFS (which depends on GoLang) to work. Install IPFS? [Y/n] \e[0m"
      read insipfs
      case $insipfs in
         [nN])
            echo "Cannot install Gitty without its dependencies."
            exit;;
         [yY])
            nodemodules="/usr/lib/node_modules"
            echo "Moving Dat..."
            cd include && sudo cp -f dat.tar.gz $nodemodules
            echo "Extracting Dat..."
            cd $nodemodules
            sudo tar -zxvf dat.tar.gz
            echo "Installing Dat..."
            cd $nodemodules/dat && sudo npm link && sudo npm install -g && sudo npm update -g
            cd $nodemodules
            sudo rm dat.tar.gz
            echo "Done! Run 'gitty' command to use it." && exit
            break ;;
         *)
            echo "Invalid answer." && exit
      esac
# fi
