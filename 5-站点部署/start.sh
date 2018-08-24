#!/bin/sh

DIR=`dirname $0`
cd $DIR
java -cp .:./config:./lib/* com.juniorchina.Application --spring.profiles.active=prod $*