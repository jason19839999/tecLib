#!/bin/sh
echo zero:$0
MY_PATH=`dirname "$0"`
echo "dirname0:"$MY_PATH
cd $MY_PATH/..;
APATH=$(pwd)
LOGS=/apps/logs/update_hot_news/update_hot_news_everyday.log
java  $MAVEN_OPTS -cp bin/seek-jar-with-dependencies.jar "com.vip.seek.task.crontab.hot_news.HotNewsDealEveryDay" -c $APATH/conf $* >> $LOGS 2>&1 &
#echo $APATH
echo "log is: "$LOGS
