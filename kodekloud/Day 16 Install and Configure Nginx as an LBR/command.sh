#install Nginx
sudo dnf install epel-release -y
sudo dnf install nginx -y

#Define your upstream block


http {
    upstream app_servers {
        server 192.168.1.101:80;
        server 192.168.1.102:80;
        server 192.168.1.103:80;
        # Add more app servers if needed
    }

    server {
        listen 80;

        location / {
            proxy_pass http://app_servers;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
    }
}

#Test Nginx configuration
sudo nginx -t


sudo systemctl reload nginx

# Verify Apache is running on all App Servers

#On each app server:

sudo systemctl status httpd      # (CentOS/RHEL)


