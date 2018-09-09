#!/bin/bash
make html

git add .

echo "Enter somehing update description:"

read answer

git commit -m $answer

git push origin master

