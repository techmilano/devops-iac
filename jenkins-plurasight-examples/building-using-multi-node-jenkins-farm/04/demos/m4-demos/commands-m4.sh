# Multi Branch Pipeline

# Create two new branches, simulating customers that use
# on different versions of your software product
git checkout -b customer1
git checkout -b customer2

# Adding, committing, and pushing changes upstream
git add Jenkinsfile
git commit -m "Simplified Jenkinsfile"
git push origin master

# Or push to the other branches after switching to the corresponding one
git checkout customer1
# Add, commit, then push
git push origin customer1

git checkout customer2
# Add, commit, then push
git push origin customer2
