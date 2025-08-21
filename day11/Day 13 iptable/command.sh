# Install iptables packages CentOS 7 / 8 / Stream
sudo dnf install iptables iptables-services -y   # CentOS 8/Stream

# Enable iptables service

sudo systemctl enable iptables
sudo systemctl start iptables

# Edit /etc/sysconfig/iptables
sudo vi /etc/sysconfig/iptables

# Allow traffic from LBR host only
-A INPUT -p tcp -s 172.16.32.14 --dport 8085 -j ACCEPT

# Drop everything else on 8085
-A INPUT -p tcp --dport 8085 -j DROP


sudo systemctl restart iptables
# Verify iptables rules
sudo iptables -L -n -v
# Check if iptables is running
sudo systemctl status iptables
# Check if iptables is enabled
sudo systemctl is-enabled iptables
# Check if iptables is active
sudo systemctl is-active iptables
# Check if iptables is running


