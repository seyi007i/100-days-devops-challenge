sudo netstat -tulnp | grep 6300
# tcp        0      0 127.0.0.1:6300          0.0.0.0:*               LISTEN      784/sendmail: accep 
sudo systemctl stop sendmail
sudo systemctl disable sendmail

sudo systemctl restart httpd
sudo systemctl status httpd
● 