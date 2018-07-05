## 服务安装与运行 ##
**一、安装nginx-proxy**
```
  sudo chmod +x ./stack-deploy.sh
  ./stack-deploy.sh
```

**二、加入registry-service配置文件(安装完成registry后运行)**
```
  sudo chmod +x ./enable-registry-proxy.sh
  ./enable-registry-proxy.sh
```

**三、加入jenkins-service配置文件(安装完成jenkins后运行)**
```
  sudo chmod +x ./enable-jenkins-proxy.sh
  ./enable-jenkins-proxy.sh
```

**四、加入nexus-service配置文件(安装完成nexus后运行)**
```
  sudo chmod +x ./enable-nexus-proxy.sh
  ./enable-nexus-proxy.sh
  #docker registry
  sudo chmod +x ./enable-registry-proxy.sh
  ./enable-registry-proxy.sh
  #docker registry group mirror
  sudo chmod +x ./enable-registry-group-proxy.sh
  ./enable-registry-group-proxy.sh
  
```