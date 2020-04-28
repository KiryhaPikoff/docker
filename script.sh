#!/bin/bash

cd
cd script-docker/
git clone https://gitlab.com/romanov73/example-jpa.git
cd example-jpa/

gradle wrapper
./gradlew clean build

cd ..
sudo docker build -t pikoff_image -f dockerfile .
sudo docker volume create application
sudo cp -r /home/pikoff/script-docker/example-jpa /var/lib/docker/volumes/application/_data
sudo docker run —mount source=application,target=/jar-file pikoff_image