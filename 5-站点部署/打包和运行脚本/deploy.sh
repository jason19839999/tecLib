#!/bin/sh

git pull origin pre_product


mvn install -Dmaven.test.skip=true


ansible-playbook deploy.yml
#w" =="$2"
