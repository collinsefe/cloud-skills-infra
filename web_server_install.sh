#!/bin/bash
sudo dnf update -y
sudo dnf install -y httpd

# Start the web server 
sudo systemctl start httpd

# Configure the web server to start
sudo systemctl enable httpd
