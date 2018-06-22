#!/bin/bash
git status
sleep 3
echo "-------Begin-------"
git add .
git commit -am "自动化代码提交"
git push origin master

echo "--------End--------"
