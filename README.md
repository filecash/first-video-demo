# 首个基于FileCash储存的视频演示
此项目将用于演示IPFS技术结合视频处理软件在FileCash网络上的应用演示。
## 1.架构图
![demo](img/filecash-video-demo.png)

## 2.技术指标定义以及语言选型、框架选型

nginx: openresty  
webui: nodejs vue bootstrap  
ipfs gateway publish: lua  
web api helper: python3 fastapi  
background process: python3 ffmpeg  

## 3.项目进度及未完成的项目

1. 基础服务配置搭建
    * □ redis 安装
    * □ rabbitmq 安装
    * □ ipfs node 搭建
    * □ ipfs public gateway 搭建
    * □ lotus filecash full node 搭建
2. 钱包
    * □ webui 实现网页钱包管理
    * □ webui 实现用户网页隔离
    * □ helper 实现网页钱包管理
    * □ helper 实现用户网页隔离
3. filecash取出的文件缓存到ipfs中
    * □ 实现订单取回
    * □ 实现ipfs pin 服务
    * □ 实现ipfs 缓存回收
4. 查询免费网络 ipfs
    * □ 优先查询免费网络 ipfs
    * □ 管理 ipfs pin
5. 用户上传视频
    * □ 上传UI
    * □ 后端上传接口
    * □ 转码及获取视频检索数据
    * □ 管理员核审已经页面展示
    * □ 视频分割

## 4.部署方式

系统需求: Ubuntu20  
性能需求: 4 CPUs  
内存需求: 16G或更大  
磁盘需求: 100G用于存取缓存  
网络需求: 连接internet用于部署时下载依赖

使用root部署(使用传统VM+service部署)
~~~bash
git clone https://github.com/filecash/first-video-demo.git
bash install.sh
~~~
