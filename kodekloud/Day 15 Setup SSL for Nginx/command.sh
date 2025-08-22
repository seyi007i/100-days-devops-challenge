# Install Nginx
sudo dnf install epel-release -y
sudo dnf install nginx -y


#Enable and start it:

sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx

#Move SSL cert & key to a proper location

#By convention, SSL certs go under /etc/nginx/ssl/.

sudo mkdir -p /etc/nginx/ssl
sudo mv /tmp/nautilus.crt /etc/nginx/ssl/
sudo mv /tmp/nautilus.key /etc/nginx/ssl/
sudo chmod 600 /etc/nginx/ssl/nautilus.key

#Configure Nginx for SSL

#the default SSL config file (or create a new one):

sudo vi /etc/nginx/nginx.conf


#Add or modify:

#server {
#    listen 443 ssl;
#    server_name _;

#    ssl_certificate     /etc/nginx/ssl/nautilus.crt;
#    ssl_certificate_key /etc/nginx/ssl/nautilus.key;

#    root /usr/share/nginx/html;
#    index index.html;
#}

#Create index.html

echo "Welcome!" | sudo tee /usr/share/nginx/html/index.html
sudo systemctl restart nginx
#Check if Nginx is running and serving the page
curl -k https://localhost
