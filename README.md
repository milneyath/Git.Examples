# Git Workflow Example: Master → Dev → Feature

A comprehensive guide and demonstration of Git branching strategy with Master → Dev → Feature workflow, focusing on how to handle changes in the Dev branch while Feature branches are being developed.

## Overview

This repository provides a complete guide to implementing a robust Git workflow for team-based development. It focuses on:

1. **Branching Strategy**: Master → Dev → Feature branches
2. **Handling Integration**: Managing Dev changes during feature development
3. **Workflow Options**: Merge vs. Rebase approaches with pros and cons
4. **Conflict Resolution**: Step-by-step guidance for resolving conflicts
5. **Interactive Examples**: Shell scripts to demonstrate workflows
6. **Tool Comparisons**: Guidance for teams using both CLI and GitHub Desktop

![Branching Strategy Visualization](https://mermaid.ink/img/pako:eNplkMFKw0AQhl9lmJMFX8A59JSWJgehpVdvS5rZNtDNhu1GrKXv7iYpLYgzh2G--f7_sOdYGY-YYdc6-Z6h1lKQz9qGZNW9nG27F_fmLJWp6TSkTCW71ixrDk6G7Bgx46jd2vV4LtmVRh1P57NJIVK_oY4VB50qJzq1egM5vJo9gx1c4-P4PbRzKIcgI2PXs4f75Qo-Av0O9HGcr7H0QvoWXVa1K9bopZxPgDkMw-DjbzCRwb3hF96VZcwRbYQ2Qq88KWnIBdtQVg8nPjz_jyPUJFVDaELpO2r_AVmvakU?type=png)

## Quick Start

1. Clone this repository
2. Browse the `git-workflow-guide.md` file for a complete overview
3. Explore the `/examples` directory for specific workflow demonstrations
4. Run scripts in the `/scripts` directory to see interactive simulations

```bash
# Clone the repository
git clone https://github.com/username/git-workflow-example.git
cd git-workflow-example

# Make the simulation script executable (Unix/Linux/macOS)
chmod +x scripts/simulate-workflow.sh

# Run the simulation
./scripts/simulate-workflow.sh
```

## Repository Structure

- `project-plan.md` - Project overview and implementation plan
- `worklog.md` - Record of tasks and progress
- `.project-rules.md` - Guidelines for contributing to this repository
- `git-workflow-guide.md` - Main tutorial document
- `github-desktop-vs-cli.md` - Comparison of Git CLI and GitHub Desktop workflows
- `/examples/` - Directory containing step-by-step examples
  - `/basic-workflow/` - Simple example of the complete flow
  - `/merge-workflow/` - Detailed example of the merge strategy
  - `/rebase-workflow/` - Detailed example of the rebase strategy
- `/scripts/` - Interactive demonstrations
- `/diagrams/` - Directory for diagram source files (if needed)

## Key Topics Covered

### Master → Dev → Feature Strategy

- **Master Branch**: Production-ready code, always stable
- **Dev Branch**: Integration branch, prepared for next release
- **Feature Branches**: Individual features in development

### When Dev Changes During Feature Development

Two main approaches with different trade-offs:

#### 1. Merge Approach

```bash
git checkout feature/my-feature
git merge dev
# Resolve any conflicts
git commit
```

**Pros**: Preserves history, non-destructive, simple
**Cons**: Creates merge bubbles, less linear history

#### 2. Rebase Approach

```bash
git checkout feature/my-feature
git rebase dev
# Resolve any conflicts
```

**Pros**: Clean linear history, easier to follow
**Cons**: Rewrites commit history, requires force push if branch already shared

### Conflict Resolution

Detailed examples for resolving conflicts with both approaches:
- During merge
- During rebase (which may require resolving the same conflict multiple times)

### Git Tools Comparison

Guidance for teams using different Git tools:
- Comparing Git CLI and GitHub Desktop workflows
- How to perform equivalent operations in both tools
- Strategies for mixed-tool teams
- Branch vs. Fork approaches

## Interactive Learning

The `/scripts` directory contains shell scripts that simulate real-world Git workflows with two developers. These scripts:

1. Create separate workspaces for each developer
2. Demonstrate parallel feature development
3. Show how to handle Dev branch changes
4. Demonstrate conflict resolution
5. Show the complete workflow from feature development to release

## Best Practices

This repository documents best practices for:

- Commit message formatting
- Branch naming conventions
- When to use merge vs. rebase
- Pull request workflows
- Feature branch lifetimes
- Conflict prevention strategies

## Project Files

To understand the organization and planning of this repository:

- See `project-plan.md` for the overall approach
- Check `worklog.md` for progress tracking
- Read `.project-rules.md` for repository guidelines

## Requirements

- Git 2.20+ recommended
- Bash or similar shell for running scripts

## License

This project is open source and available under the [MIT License](LICENSE).

## Contributing

Contributions to improve examples or extend the documentation are welcome. Please check `.project-rules.md` for contribution guidelines. 