# Git Workflows: CLI vs. GitHub Desktop

This guide compares command-line Git with GitHub Desktop, helping teams understand the differences and work together effectively even when using different tools.

## Table of Contents

1. [Overview: CLI vs. GitHub Desktop](#overview-cli-vs-github-desktop)
2. [Feature Comparison](#feature-comparison)
3. [Common Workflows Comparison](#common-workflows-comparison)
4. [Merging Dev Changes into Feature Branches](#merging-dev-changes-into-feature-branches)
5. [Branches vs. Forks Approach](#branches-vs-forks-approach)
6. [Team Strategies for Mixed Tool Usage](#team-strategies-for-mixed-tool-usage)
7. [Cheat Sheet: CLI vs. Desktop Equivalents](#cheat-sheet-cli-vs-desktop-equivalents)

## Overview: CLI vs. GitHub Desktop

### Git Command Line Interface (CLI)

**Git CLI** refers to using Git through terminal commands. It provides:
- Complete access to all Git functionality
- Greater flexibility and control
- Scriptability for automation
- Steeper learning curve

**Example CLI command:**
```bash
git checkout -b feature/new-login
git add login.js
git commit -m "feat: Add login functionality"
git push -u origin feature/new-login
```

### GitHub Desktop

**GitHub Desktop** is a GUI application that provides:
- Visual representation of changes and history
- Simplified Git operations through clicks rather than commands
- More intuitive for Git beginners
- Integration with GitHub-specific features
- Limited access to some advanced Git operations

**Example Desktop workflow:**
1. Click "Current Branch" dropdown
2. Choose "New Branch"
3. Name it "feature/new-login"
4. Make changes to files
5. Review changes in the Changes tab
6. Add a commit message and click "Commit to feature/new-login"
7. Click "Publish branch" or "Push origin"

## Feature Comparison

| Feature | Git CLI | GitHub Desktop | Notes |
|---------|---------|----------------|-------|
| **Complete Git functionality** | ✅ Full access | ⚠️ Limited to common operations | CLI provides access to all Git features and parameters |
| **Visualizing changes** | ⚠️ Limited text-based diff | ✅ Visual diff with highlighting | Desktop offers better visualization of changes |
| **Learning curve** | ⚠️ Steeper | ✅ Gentler for beginners | Desktop abstracts Git complexity |
| **Speed for experienced users** | ✅ Faster for power users | ⚠️ Sometimes requires more clicks | CLI is more efficient once commands are memorized |
| **Branch management** | ✅ Full control | ✅ Easy to use | Both handle basic branch operations well |
| **Merge operations** | ✅ All merge options | ⚠️ Basic merge support | CLI offers more merge strategies and options |
| **Rebase operations** | ✅ Full rebase control | ⚠️ Limited rebase support | Desktop has basic rebase but lacks advanced features |
| **Resolving conflicts** | ⚠️ Text-based | ✅ Visual merge tool | Desktop offers better conflict resolution UX |
| **Cherry-picking** | ✅ Full support | ⚠️ Limited support | CLI offers more flexibility for cherry-picking |
| **Stashing changes** | ✅ Full stash functionality | ✅ Basic stashing | Desktop has simplified stashing without all CLI options |
| **Working with remotes** | ✅ Full control | ⚠️ Primarily GitHub-focused | CLI works with any Git remote, not just GitHub |
| **Scripting & automation** | ✅ Fully scriptable | ❌ Not scriptable | CLI can be used in scripts and CI/CD |

## Common Workflows Comparison

### Creating and Working on a Feature Branch

**Using CLI:**
```bash
# Create branch
git checkout dev
git pull origin dev
git checkout -b feature/new-search

# Work, commit, and push
git add search.js
git commit -m "feat: Add search functionality"
git push -u origin feature/new-search
```

**Using GitHub Desktop:**
1. Ensure you're on the dev branch and click "Fetch origin" to update
2. Click "Current Branch" dropdown → "New Branch"
3. Name your branch "feature/new-search" (creating from dev)
4. Make changes to files
5. Review changes in the "Changes" tab
6. Enter a commit message and description
7. Click "Commit to feature/new-search"
8. Click "Publish branch" (first time) or "Push origin" (subsequent pushes)

### Completing a Feature and Merging to Dev

**Using CLI:**
```bash
# Update branch with latest dev changes
git checkout dev
git pull origin dev
git checkout feature/new-search
git merge dev
# Resolve conflicts if needed
git push origin feature/new-search

# Merge to dev (if you have write access)
git checkout dev
git merge feature/new-search
git push origin dev
```

**Using GitHub Desktop:**
1. Switch to dev branch and click "Fetch origin" then "Pull origin"
2. Switch back to feature/new-search branch
3. Click on "Branch" in the top menu → "Merge into current branch"
4. Select "dev" as the branch to merge from
5. Resolve any conflicts if prompted
6. Push your changes
7. **For merging to dev**: Usually done via GitHub Pull Request
   - Click "Branch" → "Create Pull Request" (opens GitHub website)
   - Complete the pull request on GitHub's web interface

## Merging Dev Changes into Feature Branches

This is a key difference between the two approaches:

### Using CLI

With CLI, you can directly merge dev into your feature branch:

```bash
# Get latest changes from dev
git checkout dev
git pull origin dev

# Merge dev into your feature branch
git checkout feature/user-auth
git merge dev
# Resolve any conflicts
git add .
git commit -m "merge: Integrate latest dev changes"
git push origin feature/user-auth
```

### Using GitHub Desktop

GitHub Desktop doesn't provide a direct way to pull changes from one branch into another like the CLI does. Instead, you have two options:

**Option 1: Using Desktop's Branch menu (Recommended):**
1. Make sure you've fetched the latest changes (click "Fetch origin")
2. Switch to your feature branch
3. Click on "Branch" in the top menu
4. Select "Merge into current branch..."
5. Select the dev branch from the list
6. If there are conflicts, use the conflict resolution tool
7. Push your changes

**Option 2: Using Pull Requests for updates (More complex):**
1. On GitHub.com, create a temporary PR from dev into your feature branch
2. Review the changes that would be merged
3. Complete the PR to merge dev into your feature branch
4. In GitHub Desktop, fetch and pull the latest changes to your feature branch

Most GitHub Desktop users don't realize that Option 1 exists and unnecessarily use Option 2 or avoid updating their feature branches entirely.

## Branches vs. Forks Approach

Another significant difference in workflow comes from using branches in a shared repository versus working with forks.

### Branch-Based Workflow

In a branch-based workflow, all team members work within the same repository but on different branches.

**Advantages:**
- Simpler project setup
- Easier to see all work in progress
- Direct access to all branches
- Better suited for smaller, closely-knit teams

**Disadvantages:**
- Less separation between developers' work
- Everyone needs write access to the repository
- Branch naming becomes crucial

**CLI and Desktop support:**
- Both CLI and Desktop handle branch-based workflows well
- CLI has slightly better branch management for advanced operations

### Fork-Based Workflow

In a fork-based workflow, each developer creates their own copy (fork) of the main repository and works within their fork.

**Advantages:**
- Better isolation between developers' work
- More controlled access to the main repository
- Better suited for open-source projects or larger teams
- Better security (fewer people need write access to main repo)

**Disadvantages:**
- More complex setup
- Requires additional remote management
- Keeping forks in sync requires extra steps

**CLI and Desktop support:**
- CLI has better support for managing multiple remotes needed in fork workflows
- GitHub Desktop simplifies some fork operations but lacks advanced remote management

### Working with Both Approaches

**For CLI users working with forks:**
```bash
# Set up your fork and the original repository
git clone https://github.com/yourusername/project.git
cd project
git remote add upstream https://github.com/original/project.git

# Keep your fork's dev branch in sync
git fetch upstream
git checkout dev
git merge upstream/dev
git push origin dev

# Create feature branches from updated dev
git checkout -b feature/new-feature
# work, commit, push to your fork
git push origin feature/new-feature

# Create PR from your fork's branch to the upstream dev branch
```

**For GitHub Desktop users working with forks:**
1. Clone your fork through GitHub Desktop
2. To add the original repository as a remote:
   - Go to Repository → Repository settings → Remotes
   - Add a remote named "upstream" pointing to the original repository
3. To sync your fork:
   - Switch to dev branch
   - Click "Branch" → "Merge into current branch"  
   - Select upstream/dev
   - Push to update your fork's dev branch
4. Work on feature branches as normal
5. Create PRs through GitHub.com

## Team Strategies for Mixed Tool Usage

When some team members use CLI and others use GitHub Desktop:

### Recommended Practices

1. **Standardize commit message formats** regardless of tool
   - Follow a convention like: `type(scope): description`
   - Example: `feat(login): Add password reset functionality`

2. **Use Pull Requests for significant merges**
   - Provides visibility and review regardless of tool preference
   - Creates documentation of changes

3. **Agree on a branching/merging strategy**
   - Decide as a team whether to use merge or rebase approaches
   - Document the decision in your project guidelines

4. **Document workflows for both tools**
   - Create cheat sheets showing equivalent operations
   - Include examples of handling common scenarios

5. **Consider the strengths of each tool**
   - Encourage Desktop users to handle conflict resolution
   - Leverage CLI users for complex Git operations

### Communication Strategies

- Clearly communicate when you've force-pushed a branch
- Let the team know when you've merged significant changes to dev
- When helping teammates, provide instructions for both CLI and Desktop
- Create shared aliases or scripts for complex CLI operations

## Cheat Sheet: CLI vs. Desktop Equivalents

| Operation | Git CLI | GitHub Desktop |
|-----------|---------|----------------|
| **Clone repository** | `git clone <url>` | File → Clone repository |
| **Create branch** | `git checkout -b branch-name` | Branch → New branch |
| **Switch branch** | `git checkout branch-name` | Click Current Branch dropdown → select branch |
| **Pull changes** | `git pull origin branch-name` | Click "Fetch origin" then "Pull origin" |
| **Stage changes** | `git add file.txt` or `git add .` | Check boxes next to changed files |
| **Commit** | `git commit -m "message"` | Type message and click "Commit to branch-name" |
| **Push** | `git push origin branch-name` | Click "Push origin" |
| **Merge branch** | `git merge other-branch` | Branch → Merge into current branch |
| **Resolve conflicts** | Edit files manually, then `git add` | Use the built-in merge conflict tool |
| **Stash changes** | `git stash` | Repository → Stash all changes |
| **Apply stash** | `git stash pop` | Repository → Restore stashed changes |
| **Discard changes** | `git checkout -- file.txt` | Right-click file → Discard changes |
| **Create PR** | (Browser required) | Branch → Create Pull Request |
| **View history** | `git log` | Click History tab |
| **View specific commit** | `git show <commit-hash>` | Click commit in History tab |
| **Add remote** | `git remote add name url` | Repository → Repository settings → Remotes |
| **Fetch from remote** | `git fetch origin` | Click "Fetch origin" | 