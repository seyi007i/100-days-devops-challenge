### navigate to the directory
cd /usr/src/kodekloudrepos/games

### add dev_games
sudo git remote add dev_games /opt/xfusioncorp_games.git

### copy to master branch 
sudo cp /tmp/index.html .

### add and commit

sudo git add .
sudo git commit -m"add index.html"
git branch

* master
### git push remote

sudo git push dev_games master
