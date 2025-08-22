Troubleshooting Steps
# Check what is using port 5000
sudo netstat -tulnp | grep :5000

#This will show the process (PID/Program) already bound to port 5000.

# stop the conflicting process (if not needed)

sudo systemctl stop 5000
# restart httpd service
sudo systemctl restart httpd

# Verify Apache is running
sudo systemctl status httpd
sudo ss -tulnp | grep httpd

# Allow port 5000 reachable on the network
sudo iptables -I INPUT 4 -p tcp --dport 5000 -j ACCEPT
