#!/bin/bash
rm ~/.ssh/known_hosts 2>/dev/null
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
#docker rmi tobiasb/rb-drupal-lamp
docker build  -t tobiasb/rb-drupal-lamp .
docker run -d -p 49102:22 -p 8082:80 -v /vagrant_data/build_test:/var/www/ tobiasb/rb-drupal-lamp
sleep 2
ssh localhost -p 49102 -l dev