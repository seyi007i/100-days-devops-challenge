# On All App Hosts  Install Apache + PHP + dependencies
# On CentOS/RHEL
sudo dnf install -y httpd php php-mysqlnd

# Configure Apache to listen on port 8087, Edit config:

sudo vi /etc/httpd/conf/httpd.conf


#Find the line, Listen 80 Change it to Listen 8087

#Start & enable Apache
sudo systemctl enable httpd
sudo systemctl start httpd

#Verify:

sudo ss -tulnp | grep 8087

#Deploy PHP app to connect to DB Create a test PHP file:

sudo mkdir -p /var/www/html
sudo vi /var/www/html/index.php



#<?php
#$servername = "DB_SERVER_IP";   # replace with your DB server IP
#$username   = "kodekloud_aim";
#$password   = "B4zNgHA7Ya";
#$dbname     = "kodekloud_db5";

#$conn = new mysqli($servername, $username, $password, $dbname);

#if ($conn->connect_error) {
#    die("Connection failed: " . $conn->connect_error);
#}
#echo "App is able to connect to the database using user kodekloud_aim";
#$conn->close();
#?>

#On the DB Server Install MariaDB
sudo yum install -y mariadb-server


#Start & enable:

sudo systemctl enable mariadb
sudo systemctl start mariadb

# Secure installation
sudo mysql_secure_installation

#Create DB and user

#Login:

mysql -u root -p


CREATE DATABASE kodekloud_db5;

CREATE USER 'kodekloud_aim'@'%' IDENTIFIED BY 'B4zNgHA7Ya';

GRANT ALL PRIVILEGES ON kodekloud_db5.* TO 'kodekloud_aim'@'%';

FLUSH PRIVILEGES;
EXIT;

#Allow remote access (if apps connect remotely)

#Edit

sudo vi /etc/my.cnf.d/mariadb-server.cnf


#Find bind-address=127.0.0.1 and either comment it or set:

#bind-address=0.0.0.0


#Restart MariaDB:

sudo systemctl restart mariadb


