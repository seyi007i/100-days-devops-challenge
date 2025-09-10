1. cd /usr/src/kodekloudrepos/official
git branch

* master
2. sudo git log --oneline

7ed362a (HEAD -> master, origin/master) Test Commit10
03aa9d7 Test Commit9
7f2b280 Test Commit8
c55612d Test Commit7
7519952 Test Commit6
2f4fd40 Test Commit5
d192143 Test Commit4
43ecee1 Test Commit3
9c0eb6e Test Commit2
5ea99cd Test Commit1
f7186ba add data.txt file
0324b44 initial commit

3. sudo git reset --hard f7186ba
   HEAD is now at f7186ba add data.txt file
4.  sudo git push origin master --force
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To /opt/official.git
 + 7ed362a...f7186ba master -> master (forced update)
 sudo git log --oneline
f7186ba (HEAD -> master, origin/master) add data.txt file
0324b44 initial commit
