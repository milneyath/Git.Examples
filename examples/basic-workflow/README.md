# Basic Git Workflow: Master → Dev → Feature

This example demonstrates the basic workflow for a Master → Dev → Feature branching strategy. Follow the commands below to understand the workflow.

## Diagram

The workflow looks like this:

```mermaid
gitGraph
   commit id: "initial"
   branch dev
   checkout dev
   commit id: "dev setup"
   branch feature1
   checkout feature1
   commit id: "feature work"
   checkout dev
   merge feature1 id: "merge feature"
   checkout master
   merge dev id: "release"
   tag "v1.0.0"
```

## Step by Step Instructions

### 1. Initial Setup

```bash
# Initialize repository
git init

# Create initial commit on master
echo "# Project Title" > README.md
git add README.md
git commit -m "Initial commit"

# Create dev branch
git checkout -b dev
echo "# Development Version" > DEVELOPMENT.md
git add DEVELOPMENT.md
git commit -m "Add development documentation"
```

### 2. Create Feature Branch

```bash
# Create feature branch from dev
git checkout dev
git checkout -b feature/new-feature

# Make changes
echo "function newFeature() { /* ... */ }" > feature.js
git add feature.js
git commit -m "feat: Add new feature function"

# Add more changes
echo "function helperFunction() { /* ... */ }" >> feature.js
git add feature.js
git commit -m "feat: Add helper function"
```

### 3. Complete Feature & Merge to Dev

```bash
# Complete the feature
echo "function finalizeFeature() { /* ... */ }" >> feature.js
git add feature.js
git commit -m "feat: Finalize feature implementation"

# Merge feature into dev
git checkout dev
git merge feature/new-feature

# Push changes to remote dev branch
git push origin dev
```

### 4. Prepare Release to Master

```bash
# Ensure dev is thoroughly tested
# Once ready for production:
git checkout master
git merge dev
git tag -a v1.0.0 -m "Version 1.0.0"
git push origin master --tags
```

## Key Points

- Always create feature branches from the latest dev branch
- Keep master clean and always production-ready
- Dev branch serves as an integration point for features
- Tag important releases on master with versions
- Ensure thorough testing before merging to master

## When to Use This Workflow

This simple workflow is ideal for:

- Small to medium-sized teams
- Projects with regular releases
- Cases where features are relatively independent
- Projects requiring a stable production branch

For more complex scenarios, including handling changes to dev while features are in progress, see the [Merge Workflow](../merge-workflow) and [Rebase Workflow](../rebase-workflow) examples. 