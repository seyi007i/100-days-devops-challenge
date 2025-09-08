Steps Performed
1. Connect to the server via SSH
   ssh natsha@ststor01
2. Navigate to the repository
   cd /usr/src/kodekloudrepos/cluster
3. Revert the latest commit
   git revert HEAD
4. Amend the revert commit message to the required one
   git commit --amend -m "revert cluster"
5. Verify the last commit
   git log --oneline -1