#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

source ./.env

message() {
    echo "................................................."
    echo "................................................."
    echo "Running Script: $1"
    echo "................................................."
    echo "................................................."
}

date
sudo chmod +x -R ./scripts

message "Global Packages"
./scripts/global-packages.sh

message "Create Directories"
./scripts/create-directories.sh

message "Run"
./scripts/run.sh

message "Clean up"
./scripts/clean-up.sh