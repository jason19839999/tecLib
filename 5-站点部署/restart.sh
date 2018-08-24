#/bin/sh

ps -ef | grep com.juniorchina.Application | grep -v grep| awk '{print $2}' | xargs kill -9
nohup java -cp .:./config/:./lib/* -Dspring.profiles.active=test-2 com.juniorchina.Application >> serving.log 2>&1 &

