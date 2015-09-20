#!/bin/bash
hugo

git subtree push -f --prefix public origin master
