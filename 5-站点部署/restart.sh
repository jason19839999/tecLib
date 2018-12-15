#/bin/sh

ps -ef | grep com.juniorchina.Application | grep -v grep| awk '{print $2}' | xargs kill -9
nohup java -cp .:./config/:./lib/* -Dspring.profiles.active=test-2 com.juniorchina.Application >> serving.log 2>&1 &


注意：***踩过的坑  Error: Could not find or load main class com.imooc.demo.GirlApplication
    查看jdk安装目录： ls -lrt /etc/alternatives/java   https://www.cnblogs.com/bincoding/p/6159847.html
    
    1. 修改/etc/profile文件
如果你的计算机仅仅作为开发使用时推荐使用这种方法，因为所有用户的shell都有权使用这些环境变量，可能会给系统带来安全性问题。
·用文本编辑器打开/etc/profile
·在profile文件末尾加入：

export JAVA_HOME=/usr/share/jdk1.6.0_14
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
 

·重新登录
·注解
a. 你要将 /usr/share/jdk1.6.0_14改为你的jdk安装目录
b. linux下用冒号“:”来分隔路径
c. PATH/PATH/CLASSPATH / $JAVA_HOME 是用来引用原来的环境变量的值
在设置环境变量时特别要注意不能把原来的值给覆盖掉了，这是一种
常见的错误。
d. CLASSPATH中当前目录“.”不能丢,把当前目录丢掉也是常见的错误。
e. export是把这三个变量导出为全局变量。
f. 大小写必须严格区分。
    
    
