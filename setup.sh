#!/bin/bash

# Variables
REPO_URL="https://github.com/aishwarymishra09/cloud-setup.git"
CLONE_DIR="cloud-setup"
SCRIPT_DIR="$CLONE_DIR/installation_script"

# Clone the repository
git clone $REPO_URL

# Check if the clone was successful
if [ ! -d "$CLONE_DIR" ]; then
  echo "Failed to clone repository."
  exit 1
fi

# Change to the installation script directory
cd $SCRIPT_DIR

# Give execution permissions to each script in the directory
for script in *.sh;
do
  chmod +x $script
done

# Run each script
for script in *.sh;
do
  ./$script
done

echo "All scripts executed successfully."
