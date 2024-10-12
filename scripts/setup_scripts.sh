sudo apt update

sudo apt upgrade

sudo apt install -y apache2

sudo apt install -y mysql-server

sudo apt install -y php libapache2-mod-php php-mysysql

sudo systemctl restart apache2

sudo systemctl enable apache2

echo "LAMP stack successfully installed"