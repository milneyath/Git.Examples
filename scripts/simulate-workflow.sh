#!/bin/bash

# Simulate Git workflow with two developers
# This script demonstrates a Master -> Dev -> Feature branching strategy
# with conflict resolution using both merge and rebase approaches

# Set up colors for output
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

print_header() {
    echo -e "\n${YELLOW}======== $1 ========${NC}\n"
}

print_dev() {
    echo -e "${GREEN}[Developer 1]${NC} $1"
}

print_dev2() {
    echo -e "${BLUE}[Developer 2]${NC} $1"
}

print_command() {
    echo -e "${PURPLE}$ $1${NC}"
}

run_command() {
    print_command "$1"
    eval "$1"
    echo ""
}

wait_for_user() {
    echo -e "${RED}Press Enter to continue...${NC}"
    read
}

# Create workspace directories
print_header "Setting up workspace"
mkdir -p dev1_workspace dev2_workspace
cd dev1_workspace

# Initialize repository (Developer 1)
print_header "Initial Repository Setup (Developer 1)"
print_dev "Initializing the repository and creating master branch"
run_command "git init"
run_command "echo '# Project Readme' > README.md"
run_command "git add README.md"
run_command "git commit -m 'Initial commit'"

# Create dev branch
print_dev "Creating dev branch"
run_command "git checkout -b dev"
run_command "echo '# Development Notes' > DEVELOPMENT.md"
run_command "echo 'function globalHelper() { return true; }' > common.js"
run_command "git add DEVELOPMENT.md common.js"
run_command "git commit -m 'feat: Add development documentation and common utilities'"

# Clone repository for Developer 2
print_header "Developer 2 Clones Repository"
cd ..
print_dev2 "Cloning the repository"
run_command "cp -r dev1_workspace/* dev2_workspace/"
run_command "cp -r dev1_workspace/.git dev2_workspace/"
cd dev2_workspace
run_command "git checkout dev"

# Both developers create feature branches
print_header "Both Developers Create Feature Branches"

# Developer 1 creates feature branch
cd ../dev1_workspace
print_dev "Creating feature branch for login system"
run_command "git checkout dev"
run_command "git checkout -b feature/login-system"
run_command "echo 'function login() { console.log(\"Logging in\"); }' > login.js"
run_command "git add login.js"
run_command "git commit -m 'feat: Add login function'"
run_command "echo 'function validateUser() { return globalHelper(); }' >> login.js"
run_command "git add login.js"
run_command "git commit -m 'feat: Add user validation function'"

# Developer 2 creates feature branch
cd ../dev2_workspace
print_dev2 "Creating feature branch for user profile"
run_command "git checkout dev"
run_command "git checkout -b feature/user-profile"
run_command "echo 'function displayProfile() { console.log(\"Displaying profile\"); }' > profile.js"
run_command "git add profile.js"
run_command "git commit -m 'feat: Add profile display function'"

# Dev branch changes while features are in progress
print_header "Changes in Dev Branch While Features in Progress"

# Developer 1 completes their feature and merges to dev
cd ../dev1_workspace
print_dev "Completing login feature and merging to dev"
run_command "git checkout dev"
run_command "git merge feature/login-system -m 'feat: Merge login system'"

# Make additional changes to dev
print_dev "Making additional changes to dev branch"
run_command "echo 'function logoutUser() { console.log(\"Logging out\"); }' >> common.js"
run_command "git add common.js"
run_command "git commit -m 'feat: Add logout function to common utilities'"

# Developer 2 now has to deal with dev changes
print_header "Developer 2 Handles Dev Changes"

# First, we simulate a "git fetch" by copying the .git directory
cd ..
print_dev2 "Fetching latest changes from remote"
run_command "rm -rf dev2_workspace/.git"
run_command "cp -r dev1_workspace/.git dev2_workspace/"
cd dev2_workspace

# Show the situation
print_dev2 "Checking status of branches"
run_command "git branch"
run_command "git log --oneline --graph --all"

wait_for_user

# Option 1: Merge approach
print_header "Option 1: Using Merge Approach"
print_dev2 "Merging latest dev changes into feature branch"
run_command "git checkout feature/user-profile"
run_command "git merge dev -m 'merge: Integrate latest dev changes'"
run_command "echo 'function updateProfile() { logoutUser(); console.log(\"Profile updated\"); }' >> profile.js"
run_command "git add profile.js"
run_command "git commit -m 'feat: Add profile update function using new logout utility'"
run_command "git log --oneline --graph --all"

wait_for_user

# Reset to pre-merge state to demonstrate rebase
print_header "Reset to Show Rebase Approach"
print_dev2 "Resetting to pre-merge state"
run_command "git reset --hard HEAD~2"

# Option 2: Rebase approach
print_header "Option 2: Using Rebase Approach"
print_dev2 "Rebasing feature branch onto latest dev"
run_command "git rebase dev"
run_command "echo 'function updateProfile() { logoutUser(); console.log(\"Profile updated\"); }' >> profile.js"
run_command "git add profile.js"
run_command "git commit -m 'feat: Add profile update function using new logout utility'"
run_command "git log --oneline --graph --all"

wait_for_user

# Now create conflict scenario
print_header "Conflict Scenario"

# Developer 1 modifies common.js
cd ../dev1_workspace
print_dev "Creating a new feature branch with conflicting changes"
run_command "git checkout dev"
run_command "git checkout -b feature/notifications"
run_command "echo 'function globalHelper() { console.log(\"Enhanced helper\"); return true; }' > common.js"
run_command "git add common.js"
run_command "git commit -m 'feat: Enhance global helper function'"
run_command "git checkout dev"
run_command "git merge feature/notifications -m 'feat: Merge notification system'"

# Copy changes to dev2 workspace
cd ..
print_dev2 "Fetching latest changes from remote"
run_command "rm -rf dev2_workspace/.git"
run_command "cp -r dev1_workspace/.git dev2_workspace/"
cd dev2_workspace

# Developer 2 also modified the same function
print_dev2 "Making conflicting changes to common.js"
run_command "git checkout feature/user-profile"
run_command "echo 'function globalHelper() { console.log(\"Alternative implementation\"); return false; }' > common.js"
run_command "git add common.js"
run_command "git commit -m 'feat: Alternative global helper implementation'"

# Try to merge dev (which will conflict)
print_header "Resolving Merge Conflict"
print_dev2 "Attempting to merge dev into feature"
run_command "git merge dev || echo 'Conflict detected!'"
print_dev2 "Resolving the conflict manually"
run_command "echo 'function globalHelper() { console.log(\"Compromise implementation\"); return true; }' > common.js"
run_command "git add common.js"
run_command "git commit -m 'resolve: Fix conflicts in global helper function'"
run_command "git log --oneline --graph --all"

wait_for_user

# Final merge to dev and master
print_header "Completing the Workflow"
print_dev2 "Merging completed feature to dev"
run_command "git checkout dev"
run_command "git merge feature/user-profile -m 'feat: Merge user profile feature'"

# Preparing for production release
print_dev "Preparing for production release"
cd ../dev1_workspace
run_command "git checkout dev"
run_command "git pull || echo 'Simulating a pull to get the latest changes'"

# Copying changes from dev2_workspace instead
run_command "rm -rf .git"
run_command "cp -r ../dev2_workspace/.git ./"

print_dev "Merging dev to master for release"
run_command "git checkout master"
run_command "git merge dev -m 'release: Version 1.0.0'"
run_command "git tag -a v1.0.0 -m 'Version 1.0.0'"
run_command "git log --oneline --graph --all"

print_header "Summary of the Workflow"
echo "This simulation demonstrated:"
echo "1. Creating a Master → Dev → Feature branching structure"
echo "2. Two developers working on separate features simultaneously"
echo "3. Handling changes in Dev while feature work is in progress"
echo "4. Both merge and rebase approaches to integrating Dev changes"
echo "5. Resolving conflicts that arise during development"
echo "6. Completing the workflow with a release to Master"

# Clean up
cd ../..
print_header "Simulation Complete"
echo "To clean up the simulation directories, you can run:"
echo "rm -rf dev1_workspace dev2_workspace" 