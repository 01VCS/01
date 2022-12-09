#!/bin/sh

echo "Installing 01..."
sudo cp -f 01 /usr/bin && sudo chmod +x /usr/bin/01

echo "Do you want to install our git replacement? 🧚‍♀️ [Y/n]"
read wrapgit
case $wrapgit in
   [nN])
      echo "Ok."
      break ;;
   [yY])
      if [ ! -f /usr/bin/gitoriginal ]; then sudo cp -rf /usr/bin/git /usr/bin/gitoriginal && sudo chmod +x /usr/bin/gitoriginal; fi
#sudo cp -rf gitoriginal /usr/bin/git && sudo chmod +x /usr/bin/git
      echo "Done."
      echo "- Installing git wrapper in /usr/bin..."
      sudo cp -f git /usr/bin
      echo "- Turning git wrapper into an executable..."
      $maysudo chmod 755 /usr/bin/git && $maysudo chmod +x /usr/bin/git
      break ;;
   *)
      echo "${invalid}" ;;
esac

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
            echo "Done! Run '01' command to use it." && exit
#            break ;;
#         *)
#            echo "Invalid answer." && exit
#      esac
# fi
