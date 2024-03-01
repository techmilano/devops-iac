#!/bin/bash

# Make changes to the repository
echo "Testing GitHub and Jenkins integration" >> README.md
# echo "Testing CodeCommit and Jenkins integration" >> README.md

# Add, commit, and push your changes upsteam
git add README.md
git commit -m "Updated README.md file"
git push origin master
