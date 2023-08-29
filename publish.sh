#!/bin/bash
# This script downloads and sets up the Easy Diffusion application in a Linux environment.
# It also uses Ngrok to create a tunnel for accessing the application remotely.

# Download and set up ngrok for creating tunnels
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1

# Prompt the user to input their ngrok authtoken
read -p "Paste authtoken here (Copy and Ctrl+V to paste then press Enter): " CRP
./ngrok authtoken $CRP 

# Download the Easy Diffusion application zip file
wget https://github.com/cmdr2/stable-diffusion-ui/releases/download/v2.5.24/Easy-Diffusion-Linux.zip  > /dev/null 2>&1

# Unzip the downloaded zip file
unzip Easy-Diffusion-Linux.zip  > /dev/null 2>&1

# Create a directory for storing model files
mkdir -p ./easy-diffusion/models/stable-diffusion > /dev/null 2>&1

# Download model checkpoints from Hugging Face
# Download anythingv45 checkpoint
wget -O ./easy-diffusion/models/stable-diffusion/anythingv45.ckpt \
    https://huggingface.co/andite/anything-v4.0/resolve/main/anything-v4.5.ckpt > /dev/null 2>&1

# Download dreamlikev20 checkpoint
wget -O ./easy-diffusion/models/stable-diffusion/dreamlikev20.ckpt \
    https://huggingface.co/dreamlike-art/dreamlike-photoreal-2.0/resolve/main/dreamlike-photoreal-2.0.ckpt > /dev/null 2>&1

# Download islamicdiffusion checkpoint
wget -O ./easy-diffusion/models/stable-diffusion/islamicdiffusion.ckpt \
    https://huggingface.co/Falah/islamicdiffusion/blob/main/islamicdiffusion.ckpt  > /dev/null 2>&1

# Set the SD_UI_BIND_PORT environment variable and start the Easy Diffusion application
SD_UI_BIND_PORT=1234 ./easy-diffusion/start.sh &>/dev/null &

# Start ngrok to create a tunnel
nohup ./ngrok http 1234 &>/dev/null &

# Display the public URL for accessing the application remotely
echo Your Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"https:..([^"]*).*/\1/p'
echo "Note: Use Right-Click Or Ctrl+C To Copy"
