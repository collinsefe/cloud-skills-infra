#!/usr/bin/env bash

source .env

sudo apt update -y
sudo apt install docker.io -y

# Download the binary for your system
sudo curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64

# Give it permission to execute
sudo chmod +x /usr/local/bin/gitlab-runner

# Create a GitLab Runner user
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

# Install and run as a service
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
sudo gitlab-runner start


sudo gitlab-runner register --non-interactive --url "https://gitlab.com" --registration-token "abcds" --description "aws-docker-second-runner" --executor "docker" --docker-image alpine
