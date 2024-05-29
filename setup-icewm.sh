#!/bin/bash

# Step 1: Download the tar.gz file
wget https://github.com/edxlinux/github-edxlinux/raw/main/icewm-md%20.tar.gz -O icewm-md.tar.gz

# Step 2: Extract the tar.gz file
tar -xzvf icewm-md.tar.gz

# Step 3: Move the extracted files to /usr/local/bin (or any other preferred location)
sudo mv icewm-md /usr/local/bin/

# Step 4: Install necessary dependencies (example for IceWM)
sudo apt update
sudo apt install -y icewm

# Step 5: Clean up
rm icewm-md.tar.gz

echo "a equipe edxlinux agradece."
