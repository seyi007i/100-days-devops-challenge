#Install Apache on App Server 3

sudo yum install -y httpd

#Configure Apache to listen on port 3001

#Edit Apache config:

sudo vi /etc/httpd/conf/httpd.conf


#Listen 80, Replace with: Listen 3001

# Copy Website Backups from Jump Host

#From the jump_host, copy the backups to App Server 3.

scp -r /home/thor/beta  /home/thor/cluster  user@APP_SERVER3_IP:/var/www/html/


#On App Server 3, you should now have:

#/var/www/html/beta
#/var/www/html/cluster

# Due to permission issues, set proper ownership:
#scp -r /home/thor/beta /home/thor/cluster banner@172.16.238.12:/tmp/
#ssh banner@172.16.238.12
#sudo mv /tmp/beta /tmp/cluster /var/www/html/
#sudo chown -R apache:apache /var/www/html/beta /var/www/html/cluster
#sudo chmod -R 755 /var/www/html/beta /var/www/html/cluster

#Configure Apache Aliases (beta and cluster)

#Edit Apache config again:

sudo vi /etc/httpd/conf/httpd.conf


#At the end of the file, add:

#Alias /beta/ "/var/www/html/beta/"
#<Directory "/var/www/html/beta/">
#    Options Indexes FollowSymLinks
#    AllowOverride All
#    Require all granted
#</Directory>

#Alias /cluster/ "/var/www/html/cluster/"
#<Directory "/var/www/html/cluster/">
#    Options Indexes FollowSymLinks
#    AllowOverride All
#    Require all granted
#</Directory>

# Start & Enable Apache
sudo systemctl enable httpd
sudo systemctl start httpd


#Check it’s listening on port 3001:

sudo ss -tulnp | grep 3001

#Test

#From App Server 3:

curl http://localhost:3001/beta/
curl http://localhost:3001/cluster/


