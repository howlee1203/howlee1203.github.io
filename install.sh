# bash

# gen blog
nvm use v18.17.1
rm -rf node_modules && npm install --force
hexo clean
hexo d

# push blog to branch:release
git worktree add docs release
cp -rf public/* docs
cd docs
CurrentTimestampe=`date '+%Y%m%d_%H%M%S'`
git checkout -b $CurrentTimestampe
git commit -m "Github Action in $CurrentTimestampe"
git rebase -i $CurrentTimestampe release
cd ..
git worktree remove docs
git branch -D $CurrentTimestampe