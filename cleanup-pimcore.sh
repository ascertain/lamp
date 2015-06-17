#!/bin/bash
sudo service apache2 stop
sudo a2dissite USDuploLandingPage.conf
sudo rm -rf /var/www/US*
sudo rm -rf /etc/apache2/sites-available/US*
sudo mysql -u root -pLego123@1 -e "DROP Database USDuploLandingPage_db"
sudo service apache2 restart
