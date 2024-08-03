#!/bin/bash

# Install pip if it's not already installed
if ! command -v pip3 &> /dev/null; then
    echo "pip3 could not be found, installing..."
    sudo apt update
    sudo apt install -y python3-pip
fi

# Create and activate a virtual environment
python3 -m venv myenv
source myenv/bin/activate

# Upgrade pip inside the virtual environment
pip install --upgrade pip

# Clone the main repository
git clone https://github.com/comfyanonymous/ComfyUI.git

# Change directory to the main ComfyUI folder
cd ComfyUI

# Install requirements from the main ComfyUI directory
if [ -f "requirements.txt" ]; then
    echo "Installing requirements for ComfyUI..."
    pip install -r requirements.txt
fi

# Change directory to the custom_nodes folder
cd custom_nodes

# List of repositories to clone
repos=(
    "https://github.com/evanspearman/ComfyMath.git"
    "https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet.git"
    "https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved.git"
    "https://github.com/TemryL/ComfyUI-IDM-VTON.git"
    "https://github.com/ltdrdata/ComfyUI-Manager.git"
    "https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes.git"
    "https://github.com/Fannovel16/comfyui_controlnet_aux.git"
    "https://github.com/storyicon/comfyui_segment_anything.git"
    "https://github.com/rgthree/rgthree-comfy.git"
    "https://github.com/WASasquatch/was-node-suite-comfyui.git"
    "https://github.com/chibiace/ComfyUI-Chibi-Nodes.git"
)

# Clone each repository in the list
for repo in "${repos[@]}"; do
    git clone "$repo"
done

# Install requirements in each custom_nodes subdirectory
for repo in "${repos[@]}"; do
    repo_name=$(basename "$repo" .git)
    if [ -f "$repo_name/requirements.txt" ]; then
        cd "$repo_name"
        echo "Installing requirements for $repo_name..."
        pip install -r requirements.txt
        cd ..
    fi
done

# Change directory to ComfyUI/models/checkpoints
cd ../models/checkpoints

# Download model files using wget
wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt
wget https://huggingface.co/ckpt/crystalclear-xl/resolve/main/crystalClearXL_ccxl.safetensors?download=true

# Rename the downloaded file
mv crystalClearXL_ccxl.safetensors?download=true ClearXL_ccxl.safetensors

cd ../controlnet
wget https://huggingface.co/stabilityai/control-lora/resolve/main/control-LoRAs-rank256/control-lora-canny-rank256.safetensors
echo "All repositories have been cloned, requirements installed, and model files downloaded successfully."
