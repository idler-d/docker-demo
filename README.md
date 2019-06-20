## 构建基础设施 ##
**一、基础思路**

![NONE](img/base.jpg)

***nexus作为docker、maven、npm私库和中间缓存***
![NONE](img/nexus_docker.png)

***jenkins作为maven编译、dockerfile-maven插件打包docker镜像、把docker镜像发布到nexus的docker私库***
![NONE](img/jenkins_docker.png)

jenkins 容器通过tcp ssl连接宿主机docker 服务进行镜像打包