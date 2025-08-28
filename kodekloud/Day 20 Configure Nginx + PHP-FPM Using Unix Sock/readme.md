## Install Nginx

sudo yum install -y epel-release
sudo yum install -y nginx

## Install PHP 8.1 + PHP-FPM
### Enable Remi repo if needed (for PHP 8.1)
sudo yum install -y https://rpms.remirepo.net/enterprise/remi-release-9.rpm
sudo yum module reset -y php
sudo yum module enable -y php:remi-8.1
sudo yum install -y php php-cli php-fpm php-mysqlnd



## Configure PHP-FPM socket

Edit the PHP-FPM pool config:

sudo vi /etc/php-fpm.d/www.conf


### Change these lines:

listen = /var/run/php-fpm/default.sock
listen.owner = nginx
listen.group = nginx
listen.mode = 0660


## Create the socket directory:

sudo mkdir -p /var/run/php-fpm
sudo chown nginx:nginx /var/run/php-fpm


Enable and start PHP-FPM:

sudo systemctl enable php-fpm
sudo systemctl start php-fpm


#### Check socket:

ls -l /var/run/php-fpm/default.sock

## Configure Nginx

sudo vi /etc/nginx/nginx.conf


Inside the http { ... } block, add a new server:

server {
    listen 8092;
    server_name stapp03;

    root /var/www/html;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_pass unix:/var/run/php-fpm/default.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}



## Start Services

sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl restart php-fpm


#### Check listening port:

sudo ss -tulnp | grep 8092

### Test from Jump Host
curl http://stapp03:8092/index.php