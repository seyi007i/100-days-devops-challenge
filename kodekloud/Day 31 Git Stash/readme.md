## What is git stash?

git stash is a Git feature that lets you temporarily save (stash) changes in your working directory without committing them, so you can work on something else and come back later.

Think of it like a clipboard or a “shelf” for your uncommitted changes.

### Basic commands

1. Save changes to stash

git stash


or with a message:

git stash save "WIP: working on feature X"


2. List stashes

git stash list


Example:

stash@{0}: WIP on master: 03aa9d7 Test Commit9
stash@{1}: WIP on feature: update readme


3. Apply the latest stash (keep it in stash list)

git stash apply


4. Pop the latest stash (apply & remove from list)

git stash pop


5. Apply a specific stash

git stash apply stash@{1}


6. Drop a stash (delete it)

git stash drop stash@{0}


7. Clear all stashes

git stash clear