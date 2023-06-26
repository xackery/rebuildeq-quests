# rebuildeq-quests
Quests DB

To get a remote variant of peq:

git remote add peq git@github.com:ProjectEQ/projecteqquests.git
git fetch peq
git checkout -b peq-master peq/master


git checkout main # get main branch
git branch xackery/jun-latest # create a new branch based on latest main
git merge eqemu-master xackery/jun-latest # merge all the changes on my eqemu-master branch to xackery/may-latest

once reviewed, can PR back into main