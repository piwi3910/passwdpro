#!/bin/bash

# Script to push all submodules to their respective GitHub repositories
# Run this script after creating the repositories on GitHub

echo "Pushing passwdpro-server..."
cd passwdpro-server
git push --set-upstream origin master

echo "Pushing passwdpro-mobile..."
cd ../passwdpro-mobile
git push --set-upstream origin master

echo "Pushing passwdpro-web..."
cd ../passwdpro-web
git push --set-upstream origin master

echo "Pushing passwdpro-desktop..."
cd ../passwdpro-desktop
git push --set-upstream origin master

echo "Pushing passwdpro-shared..."
cd ../passwdpro-shared
git push --set-upstream origin master

echo "All submodules pushed successfully!"