#!/bin/bash
rm -rf public
hugo

git add --all
git commit -am "building for deploy"
git push

git push origin :master
git subtree push --prefix public origin master
