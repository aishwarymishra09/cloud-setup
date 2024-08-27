#!/bin/bash

# Variables
REPO_URL="https://github.com/aishwarymishra09/cloud-setup.git"
CLONE_DIR="cloud-setup"
SCRIPT_DIR="$CLONE_DIR/installation_script"

# Clone the repository
#git clone $REPO_URL

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
bash ./comfy_install.sh
bash ./mlbe_install.sh
cd ../../
mv cloud-setup/installation_script/ComfyUI .
mv cloud-setup/installation_script/mlbe .
#cd $SCRIPT_DIR
#bash ./mlbe_service.sh
#bash ./comfy_service_c.sh

############################################################
#                   for runpod                             #
############################################################
cd mlbe/ml-be/
nohup python3 main.py &> output.log &

cd ../../ComfyUI/
nohup python3 main.py --listen "0.0.0.0" &> comfy_out.log &

############################################################
#                   for runpod                             #
############################################################


# Run each script
#for script in *.sh;
#do
#  ./$script
#done
#cd ../../
#mv cloud-setup/installation_script/ComfyUI .
#mv cloud-setup/installation_script/mlbe .
echo "All scripts executed successfully."
