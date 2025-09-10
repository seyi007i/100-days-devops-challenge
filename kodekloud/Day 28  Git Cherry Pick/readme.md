1.  cd /usr/src/kodekloudrepos/games

2. git branch

* feature
  master
3. git log --oneline

989b5df (HEAD -> feature, origin/feature) Update welcome.txt
e3b12ed Update info.txt
d22b8bf (origin/master, master) Add welcome.txt
1edb086 initial commit

4. git checkout master

Switched to branch 'master'
Your branch is up to date with 'origin/master'.

5. git cherry-pick e3b12ed

[master d81a726] Update info.txt
 Date: Mon Sep 8 21:10:55 2025 +0000
 1 file changed, 1 insertion(+), 1 deletion(-)

6. git push

Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 16 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 317 bytes | 317.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To /opt/games.git
   d22b8bf..d81a726  master -> master
