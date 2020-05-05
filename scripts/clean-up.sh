#!/bin/bash

echo "pruning old docker images..."
sudo docker image prune -a -f