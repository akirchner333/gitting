git checkout --orphan replace-branch

git add -A

git commit -am "Clear Old Commits"

git branch -D master

git branch -m master

git push -f --set-upstream origin master

git gc --aggressive --prune=all