# Submodule Setup Guide

This document describes how to work with the Git submodules in this project.

## Initial Setup

To initialize the submodules after cloning the main repository:

```bash
git submodule init
git submodule update
```

## Create/Update Submodules

To create a new submodule:

```bash
git submodule add -b main <repository-url> <path>
```

To update a submodule to the latest commit on main:

```bash
cd <submodule-path>
git checkout main
git pull
cd ..
git add <submodule-path>
git commit -m "Update <submodule-name> to latest main"
```

## Working with Submodules

When making changes in a submodule:

1. Navigate to the submodule directory
2. Make your changes
3. Commit and push the changes in the submodule
4. Update the main repository to reference the new commit:

```bash
cd ..  # Return to main repository
git add <submodule-path>
git commit -m "Update <submodule-name> reference"
git push
```

## Clone Repository with Submodules

To clone the main repository along with all submodules:

```bash
git clone --recurse-submodules <repository-url>
```

## Troubleshooting

If submodules are showing as modified without any changes:

```bash
git submodule update --init --recursive
```

If you need to switch a submodule to the main branch:

```bash
cd <submodule-path>
git checkout main
cd ..
git add <submodule-path>
git commit -m "Switch <submodule-name> to main branch"
```