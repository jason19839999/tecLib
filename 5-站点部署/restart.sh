#/bin/sh

ps -ef | grep com.juniorchina.Application | grep -v grep| awk '{print $2}' | xargs kill -9
nohup java -cp .:./config/:./lib/* -Dspring.profiles.active=test-2 com.juniorchina.Application >> serving.log 2>&1 &


注意：***踩过的坑  Error: Could not find or load main class com.imooc.demo.GirlApplication

  第一步：将/etc下的profile文件末尾的CLASSPATH系统变量最前面加入.:，. 代表当前路径。

      原来的/etc/profie文件中的CLASSPATH为：  

      CLASSPATH=$JAVA_HOME/jre/lib/ext:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar。

      增加后的CLASSPATH为：CLASSPATH=.:$JAVA_HOME/jre/lib/ext:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

      第二步：命令行输入source /etc/profie，使/etc/profile中的系统变量生效，即可运行。

      注意：可以修改系统变量的前提是当前用户为root。在命令行输入source /etc/profile，系统变量只是临时生效，关闭Terminal，系统变量即恢复原状，因为系统变量是在系统启动时加载，所以，本次改变系统变量只有在下次系统重启时才会自动加载，才不用再输入source /etc/profie。
--------------------- 
作者：魏晓蕾 
来源：CSDN 
原文：https://blog.csdn.net/gongxifacai_believe/article/details/53081466 
版权声明：本文为博主原创文章，转载请附上博文链接！
