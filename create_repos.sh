#!/bin/bash

# Script to create GitHub repositories for all submodules and push them

# Create repositories
echo "Creating GitHub repositories for submodules..."

echo "Creating passwdpro-server repository..."
gh repo create piwi3910/passwdpro-server --private --description "Server component for PasswdPro password manager" --source=./passwdpro-server --push

echo "Creating passwdpro-mobile repository..."
gh repo create piwi3910/passwdpro-mobile --private --description "Mobile app for PasswdPro password manager" --source=./passwdpro-mobile --push

echo "Creating passwdpro-web repository..."
gh repo create piwi3910/passwdpro-web --private --description "Web app for PasswdPro password manager" --source=./passwdpro-web --push

echo "Creating passwdpro-desktop repository..."
gh repo create piwi3910/passwdpro-desktop --private --description "Desktop app for PasswdPro password manager" --source=./passwdpro-desktop --push

echo "Creating passwdpro-shared repository..."
gh repo create piwi3910/passwdpro-shared --private --description "Shared code for PasswdPro password manager" --source=./passwdpro-shared --push

echo "All repositories created and code pushed!"