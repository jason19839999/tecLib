#/bin/sh

ps -ef | grep com.juniorchina.Application | grep -v grep| awk '{print $2}' | xargs kill -9
nohup java -cp .:./config/:./lib/* -Dspring.profiles.active=test-2 com.juniorchina.Application >> serving.log 2>&1 &


注意：***踩过的坑  Error: Could not find or load main class com.imooc.demo.GirlApplication
    查看jdk安装目录： ls -lrt /etc/alternatives/java  https://blog.csdn.net/hjm6507307/article/details/80723280
    
    1. 修改/etc/profile文件
·在profile文件末尾加入：

JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el7_5.x86_64
JRE_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el7_5.x86_64/jre
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
export JAVA_HOME JRE_HOME CLASS_PATH PATH

