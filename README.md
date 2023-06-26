# RebuildEQ Quests

## Configure lua

Be sure to grab [eqemu definitions](https://github.com/xackery/eqemu-definitions)


## Getting code from PEQ

First time set up of a peq remote host

```
git remote add peq git@github.com:ProjectEQ/projecteqquests.git
git fetch peq
git checkout -b peq-master peq/master
```


To do cadence of pulling latest from peq:
```
git checkout peq-master # switch to peq
git pull # pull latest
git checkout main # get main branch
git pull # pull latest of main
git branch xackery/jun-latest # create a new branch based on latest main
git checkout xackery/jun-latest # change to new branch
git merge peq-master xackery/jun-latest # merge all the changes on my eqemu-master branch to xackery/may-latest
```

If you get an error about "refusing to merge unrelated histories", then you haven't done the process above. You can one time do:
```
git merge peq-master xackery/jun-latest --allow-unrelated-histories
```
once reviewed, can PR back into main