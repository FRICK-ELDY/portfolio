#!/bin/bash
cd ./umbrella
sudo rm -rf deps _build
mix deps.get
mix format
