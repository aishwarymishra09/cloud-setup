#!/bin/bash

# Create a directory named mlbe
mkdir -p mlbe

# Change to the mlbe directory
cd mlbe

# Clone the repository
git clone https://github.com/aishwarymishra09/ml-be.git

# Change to the ml-be directory
cd ml-be

# Checkout to the clothing branch
git checkout clothing

# Pull the latest changes from the clothing branch
git pull origin clothing

# Install the requirements
pip3 install -r requirements.txt

# Output
echo "Setup complete"
