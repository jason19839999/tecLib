#/bin/sh

ps -ef | grep com.juniorchina.Application | grep -v grep| awk '{print $2}' | xargs kill -9
nohup java -cp .:./config/:./lib/* -Dspring.profiles.active=test-2 com.juniorchina.Application >> serving.log 2>&1 &

在家里配置站点，修改了环境变量还是不行最后用 nohup java -jar demo-0.0.1-SNAPSHOT.jar > demo.log &

注意：***踩过的坑  Error: Could not find or load main class com.imooc.demo.GirlApplication
    查看jdk安装目录： ls -lrt /etc/alternatives/java  https://blog.csdn.net/hjm6507307/article/details/80723280
    
    1. 修改/etc/profile文件
·在profile文件末尾加入：

JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el7_5.x86_64
JRE_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el7_5.x86_64/jre
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
export JAVA_HOME JRE_HOME CLASS_PATH PATH

公司serving配置
#java
export JAVA_HOME=/apps/svr/java
export JRE_HOME=/apps/svr/java/jre
export SPARK_HOME=/opt/spark
export PIO_HOME=/opt/PredictionIO
export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH
export CLASSPATH=$CLASSPATH:.:$JAVA_HOME/lib:$JAVA_HOME/jre/li
export PATH=/usr/local/bin:$PATH
export PATH=/usr/lib64/qt-3.3/bin:/apps/svr/java/bin:/apps/svr/java/jre/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/apps/svr/mysql/bin:$SPARK_HOME/bin:$PIO_HOME/bin
export GOOGLE_APPLICATION_CREDENTIALS=/apps/svr/google-trans/fintrans-beb5fb233894.json
#set maven environment
M2_HOME=/apps/svr/apache-maven-3.1.1
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH=$M2_HOME/bin:$PATH

alias ll='ls -Cal'
alias l='ls -Cal'
