# PasswdPro Submodule Setup

This document provides instructions for setting up the GitHub repositories for the PasswdPro project's submodules.

## Required Repositories

The following repositories need to be created on GitHub:

1. https://github.com/piwi3910/passwdpro-server
2. https://github.com/piwi3910/passwdpro-mobile
3. https://github.com/piwi3910/passwdpro-web
4. https://github.com/piwi3910/passwdpro-desktop
5. https://github.com/piwi3910/passwdpro-shared

## Steps to Create Repositories

1. Log in to your GitHub account
2. For each repository listed above:
   - Click on the "+" icon in the top right corner and select "New repository"
   - Enter the repository name (e.g., "passwdpro-server")
   - Add a description (optional)
   - Choose "Private" or "Public" visibility as appropriate
   - Do NOT initialize the repository with a README, .gitignore, or license
   - Click "Create repository"

## Pushing Submodules

After creating all the repositories, run the provided script to push all submodules:

```bash
./push_submodules.sh
```

This script will push each submodule to its corresponding GitHub repository.

## Verifying Setup

After pushing all submodules, you can verify the setup by:

1. Checking the status of all submodules:
   ```bash
   git submodule status
   ```

2. Ensuring all submodules can be updated:
   ```bash
   git submodule update --remote
   ```

3. Verifying that changes can be pushed to each submodule:
   - Make a small change in each submodule
   - Commit the change
   - Push to the remote repository

## Troubleshooting

If you encounter issues:

1. Ensure you have the correct permissions for all repositories
2. Verify that the remote URLs in the .gitmodules file are correct
3. Check that you've properly initialized and updated all submodules