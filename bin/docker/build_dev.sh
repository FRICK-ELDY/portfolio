#!/bin/bash
cd ./umbrella
sudo rm -rf deps _build
mix deps.get
cd ../
docker compose --profile dev up --build
