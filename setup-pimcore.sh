#!/bin/bash

function pause(){
   read -p "Press [Enter] key to continue..."
}

clear
dbPostfix="_db"
echo "Enter SiteName: "
read site
#site="USDuploLandingPage"
#echo "Enter MySQL User: "
#read mySQLUser
mySQLUser="root"
#echo "Enter MySQL Password: "
#read mySQLPassword
mySQLPassword="Lego123@1"
dbName=$site$dbPostfix
siteDir="/var/www/$site"
#echo "Db Name: $dbName"



if [ $site == "" ]; then
	echo "No Site Found. Please run again"
	exit -1
else
   sudo mkdir $siteDir
   sudo wget https://www.pimcore.org/download/pimcore-latest.zip -P $siteDir
   sudo unzip /var/www/$site/pimcore-latest.zip -d $siteDir
   sudo chown -R www-data:www-data $siteDir
   sudo chown -R www-data:www-data $siteDir/website/var
   sudo mysql -u $mySQLUser -p$mySQLPassword -e "CREATE DATABASE $dbName CHARACTER SET utf8 COLLATE utf8_bin"

   sudo touch /etc/apache2/sites-available/${site}.conf
   sudo chmod 666 /etc/apache2/sites-available/${site}.conf
   sudo cat > /etc/apache2/sites-available/${site}.conf << EOL
<VirtualHost *:80>
        ServerAdmin webmaster@localhost

        DocumentRoot "$siteDir"

	ServerName $site

        <directory "$siteDir">
		Allowoverride All
		allow from all
	</directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
EOL

sudo a2ensite  ${site}.conf
sudo a2dissite 000-default.conf 
sudo a2enmod rewrite
sudo service apache2 restart
fi


