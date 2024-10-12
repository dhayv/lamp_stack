# update package list
sudo apt update
sudo apt upgrade

#install packages
sudt apt install htop
sudo apt install -y apache2
sudo apt install -y mysql-server
sudo apt install -y php libapache2-mod-php php-mysysql

# start services
sudo systemctl start apache2
sudo systemctl start mysql
sudo systemctl enable apache2
sudo systemctl enable mysql

# get ec2 ip
PUBLIC_IP=$(curl -s http://checkip.amazonaws.com)

# config apache
echo "Copy apache conf from repo"
sudo cp /config/apache/my-site.config  /etc/apache2/sites-available/
sudo sed -i "s/ec2-public-ip/$PUBLIC_IP/g" /etc/apache2/sites-available/my-site.confog
sudo a2ensite my-site.conf
sudo a2enmod rewrite
sudo systemctl restart apache2


echo "<?php echo '<h1> Hello World</h1>'; ?>" | sudo tee /var/www/html/index.php

# secure mysql
sudo mysql_secure_installation
sudo mysql -u root -p'your-root-password' -e "CREATE DATABASE testdb;"
sudo mysql -u root -p'your-root-password' -e "CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'password';"
sudo mysql -u root -p'your-root-password' -e "GRANT ALL PRIVILEGES ON testdb.* TO 'testuser'@'localhost';"
sudo mysql -u root -p'your-root-password' -e "FLUSH PRIVILEGES;"

echo "LAMP stack successfully installed"
