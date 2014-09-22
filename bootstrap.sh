#!/usr/bin/env bash

wget -qO - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
sudo bash -c 'echo deb http://packages.elasticsearch.org/elasticsearch/1.3/debian stable main >> /etc/apt/sources.list'
sudo apt-get update
sudo apt-get install -y openjdk-7-jdk
sudo apt-get install -y elasticsearch
sudo apt-get install -y htop

sudo bash -c 'echo cluster.name: wjgestest >> /etc/elasticsearch/elasticsearch.yml'
sudo bash -c "echo network.publish_host: $1 >> /etc/elasticsearch/elasticsearch.yml"
sudo update-rc.d elasticsearch defaults 95 10
sudo /etc/init.d/elasticsearch start

