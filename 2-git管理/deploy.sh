#!/bin/sh

git pull origin pre_product 

mvn clean package

ansible-playbook deploy.yml
#w" =="$2"
