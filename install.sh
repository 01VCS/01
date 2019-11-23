#!/bin/sh

echo "Installing Gitty..."
sudo cp -f gitty /usr/bin && sudo chmod +x /usr/bin/gitty
sudo cp -f 01 /usr/bin && sudo chmod +x /usr/bin/01
# echo "Done."

# if [ ! -e /usr/lib/node_modules/dat ]
#    then
#      echo "\e[101m Gitty depends upon IPFS to work. Install IPFS? [Y/n] \e[0m"
#      read insipfs
#      case $insipfs in
#         [nN])
#            echo "Cannot install Gitty without its dependencies."
#            exit;;
#         [yY])
#            nodemodules="/usr/lib/node_modules"
#            echo "Moving Dat..."
#            cd include && sudo cp -f dat.tar.gz $nodemodules
#            echo "Extracting Dat..."
#            cd $nodemodules
#            sudo tar -zxvf dat.tar.gz
#            echo "Installing Dat..."
#            cd $nodemodules/dat && sudo npm link && sudo npm install -g && sudo npm update -g
#            cd $nodemodules
#            sudo rm dat.tar.gz
            echo "Done! Run 'gitty' command to use it." && exit
#            break ;;
#         *)
#            echo "Invalid answer." && exit
#      esac
# fi
