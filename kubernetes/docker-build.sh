#!/bin/bash

sudo docker login

sudo docker build -t guybrush guybrush/
sudo docker tag guybrush dsinnovators/training:guybrush
sudo docker push dsinnovators/training:guybrush

# sudo docker build -t rincewind rincewind/
# sudo docker tag rincewind dsinnovators/training:rincewind
# sudo docker push dsinnovators/training:rincewind