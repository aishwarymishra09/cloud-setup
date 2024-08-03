#!/bin/bash

# Create a directory named mlbe
mkdir -p mlbe

# Change to the mlbe directory
cd mlbe

# Clone the repository
git clone https://github.com/aishwarymishra09/ml-be.git

# Change to the ml-be directory
cd ml-be

# Checkout to the bgswap branch
git checkout bgswap

# Pull the latest changes from the bgswap branch
git pull origin bgswap

# Install the requirements
pip3 install -r requirements.txt

# Output
echo "Setup complete"
