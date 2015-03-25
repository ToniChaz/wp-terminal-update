#!/bin/bash

echo "You have disabled the plugins? (y/n)"
read response
if [ ${response} = "y" ]; 
then
echo "Make backup of all files"
tar -czvf backup.tar.gz *
echo "Download wordpress latest"
wget http://wordpress.org/latest.zip
echo "Done"
echo "Make backup of wp-content"
mv wp-content wp-content-old
echo "Done"
echo "Remove wp-admin and wp-includes folders"
rm -rf wp-admin wp-includes
echo "Done"
echo "Unzip the latest wordpress"
unzip latest.zip
echo "Done"
echo "Move the new wordpress files"
mv -f wordpress/* .
echo "Done"
echo "Restore wp-content and clean project"
rm -rf wp-content
mv wp-content-old wp-content
rm -rf wordpress
rm latest.zip backup.tar.gz
echo "Done"
echo "Your wordpress has been updated, please write your installation rute for upgrade"
read wprute
xdg-open http://${wprute}/wp-admin/upgrade.php
echo "The end"
else
echo "You have to disable all plugins to continue!"
fi
