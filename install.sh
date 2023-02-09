#!/bin/sh

rocketlaunch_dir=`pwd` #from https://unix.stackexchange.com/a/52919/470623

if [ ! -e /usr/lib/01 ]; then sudo mkdir /usr/lib/01; fi

echo "Installing git..."
sudo apt-get install git -y

echo "Installing 01..." && echo "- Installing 01 command in /usr/bin..."
sudo cp -f 01 /usr/bin
echo "- Turning 01 into an executable..."
sudo chmod +x /usr/bin/01

if [ -f /usr/bin/gitoriginal ]; then
sudo cp -f git /usr/bin
fi
#programming tip from an inspired aspirant newbie: if you expect a condition to happen/be used more frequently than others, put it on front/prioritize it!
if [ ! -f /usr/bin/gitoriginal ]; then
echo "Do you want to install our git replacement? 🧚‍♀️ [Y/n]"
read wrapgit
case $wrapgit in
   [nN])
      echo "Ok."
      break ;;
   [yY])
      sudo cp -rf /usr/bin/git /usr/bin/gitoriginal && sudo chmod +x /usr/bin/gitoriginal
      echo "Done."
      echo "- Installing git wrapper in /usr/bin..."
      sudo cp -f git /usr/bin
      echo "- Turning git wrapper into an executable..."
      $maysudo chmod 755 /usr/bin/git && $maysudo chmod +x /usr/bin/git
      break ;;
   *)
      echo "${invalid}" ;;
esac
fi

echo "Are you using Nushell or any similar shells that don't support numbers as commands? [Y/n]"
read missingnoshell
case $missingnoshell in
   [nN])
      echo "Ok."
      break ;;
   [yY])
      echo "- Installing z1 command in /usr/bin..."
      sudo cat > /usr/bin/z1 << ENDOFFILE
#!/bin/sh

. /usr/bin/./01
ENDOFFILE
      echo "- Turning z1 into an executable..."
      $maysudo chmod 755 /usr/bin/z1 && $maysudo chmod +x /usr/bin/z1
      break ;;
   *)
      echo "${invalid}" ;;
esac
   if [ -f /usr/bin/z1 ]
   then
      zerone="z1"
   else
      zerone="01"
fi

echo "Installing 01 suite's apps..."

echo "Installing git-meta..."
cd include/git-meta
if [ ! -e .git ]; then git clone --no-checkout https://github.com/01VCS/git-meta.git .; fi
if [ -e .git ]; then git pull; fi
git checkout -f
chmod +x install.sh && sh ./install.sh
cd "$rocketlaunch_dir"

# Install git-LFS:
# echo "git-LFS is a need for supporting large file storage in git. Only install it if you're a developer in need of it."
# echo "Do you want to install git-LFS? [Y/n]"
# read insgitlfs
# case $insgitlfs in
#    [nN])
#       echo "${ok}"
#       break ;;
#    [yY])
       echo "Installing git-LFS..."
             if [ "$flofarch" = "386" ]; then
#          $maysudo gdebi include/git-LFS/git-lfs_2.9.2_i386.deb
          $maysudo dpkg -i include/git-LFS/git-lfs_2.9.2_i386.deb
          echo "Testing if git-LFS works:"
          git lfs
 fi
       if [ "$flofarch" = "amd64" ]; then
#          $maysudo gdebi include/git-LFS/git-lfs_2.9.2_amd64.deb
          $maysudo dpkg -i include/git-LFS/git-lfs_3.0.2-1_amd64.deb
          echo "Testing if git-LFS works:"
          git lfs
 fi
#       break ;;
#    *)
#       echo "${invalid}" ;;
# esac
#task: detect if have to use gdebi or dpkg; or always use dpkg

echo "Installing Pijul VCS (you did great, elder git)..."
if [ "$flofarch" = "amd64" ]; then
   tar -xzf include/pijul.tar.gz
   $maysudo mv -f pijul /usr/bin/pijul
   $maysudo chmod +x /usr/bin/pijul
   $maysudo mv -f libpijul_macros.so /usr/lib/x86_64-linux-gnu/libpijul_macros.so #wrong directory but may work
   $maysudo chmod +x /usr/lib/x86_64-linux-gnu/libpijul_macros.so #wrong directory but may work
   $maysudo mv libxxhash* -f /usr/lib/x86_64-linux-gnu
   echo "Testing if Pijul works:"
   pijul
fi

if [ "$flofarch" = "amd64" ]; then
   echo "Installing gix (you did great, elder perl git)..."
   tar -xzf include/gix-max-v0.10.0-x86_64-unknown-linux-musl.tar.gz
   $maysudo mv -f gix-max-v0.10.0-x86_64-unknown-linux-musl/gix  /usr/bin/gix
   $maysudo chmod +x /usr/bin/gix
   $maysudo mv -f gix-max-v0.10.0-x86_64-unknown-linux-musl/gixp  /usr/bin/gixp
   $maysudo chmod +x /usr/bin/gixp
   rm -rf gix-max-v0.10.0-x86_64-unknown-linux-musl
   echo "Testing if gix works:"
   gix
fi

echo "Installing ipfvcs..."
cd include/ipfvcs
if [ ! -e .git ]; then git clone --no-checkout https://github.com/01VCS/ipfvcs.git .; fi
if [ -e .git ]; then git pull; fi
git checkout -f
chmod +x install.sh && sh ./install.sh
#rm -f install.sh #use noah to exclude everything except .git
#rm -f nu-script-handler
#rm -f Tasks.txt
#rm -f .gitattributes
#rm -f .gitmeta
#rm -rf rsc
cd "$rocketlaunch_dir"

echo "Installing app icon for 01..."
cp -f icon.svg /usr/share/icons/hicolor/scalable/apps/01.svg
ln -s 01.svg /usr/share/icons/hicolor/scalable/apps/z1.svg
ln -s 01.svg /usr/share/icons/hicolor/scalable/apps/01vcs.svg
sudo gtk-update-icon-cache /usr/share/icons/gnome/ -f

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
            echo "Done! Run '$zerone' command to use it." && exit
#            break ;;
#         *)
#            echo "Invalid answer." && exit
#      esac
# fi
