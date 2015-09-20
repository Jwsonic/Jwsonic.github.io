#!/bin/bash
hugo

git push origin :master
git subtree push --prefix public origin master
