#!/bin/bash

# Variables
SERVICE_NAME="mlbe"
SERVICE_DIR="/root/mlbe/ml-be"
PYTHON_SCRIPT="main.py"
USER="root"
# Check if service directory exists
if [ ! -d "$SERVICE_DIR" ]; then
  echo "Directory $SERVICE_DIR does not exist."
  exit 1
fi

# Create a systemd service file
sudo bash -c "cat > /etc/systemd/system/$SERVICE_NAME.service" <<EOL
[Unit]
Description=Python Server Service
After=network.target

[Service]
User=root
Group=root
WorkingDirectory=/root/mlbe/ml-be/
ExecStart=python3 main.py
Restart=always

[Install]
WantedBy=multi-user.target
EOL

# Reload systemd manager configuration
sudo systemctl daemon-reload

# Start the service
sudo systemctl start $SERVICE_NAME.service

# Enable the service to start on boot
sudo systemctl enable $SERVICE_NAME.service

# Start the service
sudo systemctl restart $SERVICE_NAME.service

# Output the status of the service
sudo systemctl status $SERVICE_NAME.service

echo "mlbe server service setup complete and running."
