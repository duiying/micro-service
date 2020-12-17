<h1 align="center">
    micro-service
    <br>
</h1>
<p align="center">以 Hyperf 为基础框架的微服务 DEMO，容器化部署</p>

### 特性

- 前后端分离，UI 基于 AdminLTE3，后端框架使用 Hyperf
- 基于 Redis 实现的 token 令牌机制
- 基于 Guzzle 封装的 HTTP RPC 组件、重试组件、MySQL CRUD 组件等
- 基于 ElasticSearch 的搜索功能
- 通过 RabbitMQ 将 MySQL 中的数据同步到 ElasticSearch
- 基于 Zipkin 的链路追踪
- 容器化部署，初始化脚本

### 核心

| 描述 | 项目 |  
| :--- | :---- |
| 后台接入层 | [backend-access](https://github.com/duiying/backend-access) | 
| 权限服务 | [passport-service](https://github.com/duiying/passport-service) | 
| 内容服务 | [content-service](https://github.com/duiying/content-service) |   

其中，上面的三个项目中每一个项目都是一个基于 **Hyperf** 的工程。

### 组成

**整体**：  

<div align=center><img src="https://raw.githubusercontent.com/duiying/micro-service/master/img/micro-service.png" width="700"></div>   

**解释**：  

- backend-access 作为后台接入层，主要有两个作用：1、渲染前端页面；2、后台 API 的统一入口。
- admin.micro.service.com api.micro.service.com 这两个域名都指向 backend-access 项目，两个域名是为了区分客户端请求是「渲染视图」还是「前端调用 API 接口」。
- backend-access 通过 HTTP RPC 的方式和其他服务（如后台权限服务 passport-service）完成通信。
- 为了方便测试，给 passport-service、content-service 也各自分配了域名：passport.micro.service.com、content.micro.service.com，可以通过域名直接访问对应服务提供的 API 接口。  

**容器**：  

<div align=center><img src="https://raw.githubusercontent.com/duiying/micro-service/master/img/docker-model.png" width="700"></div>   

### 部署

[如何部署](./docs/如何部署.md)

### 链路追踪

访问：http://zipkin.micro.service.com/ ，可以看到 Zipkin 的首页。  

<div align=center><img src="https://raw.githubusercontent.com/duiying/micro-service/master/img/zipkin-index.png" width="700"></div>   

我们可以选择 serviceName 为 backend-access，表示对接入层 backend-access 作调用链追踪。  

<div align=center><img src="https://raw.githubusercontent.com/duiying/micro-service/master/img/zipkin-service-select.png" width="700"></div>   

此时，我访问内容管理下的文章，我们对开始时间倒序，观察该请求。  

<div align=center><img src="https://raw.githubusercontent.com/duiying/micro-service/master/img/zipkin-trace.png" width="700"></div>   

可以发现该请求，从 backend-access（即接入层）开始，一共经历了 backend-access、content-service、passport-service 三个项目，总共耗时 35.854ms。  

我们点击 SHOW，可以看到详细的调用链。  

<div align=center><img src="https://raw.githubusercontent.com/duiying/micro-service/master/img/zipkin-trace-detail.png" width="700"></div>   

该请求总共经历如下过程：  

1、前端发起 HTTP 请求后，在接入层（即 backend-access）首先通过 Guzzle 请求权限服务（即 passport-service）  

2、在 passport-service 中通过查 DB 和 Redis，完成权限的相关校验  
  
3、权限校验通过后，再通过 Guzzle 请求内容服务（即 content-service），拿到文章相关的数据  

4、在接入层拿到文章相关数据后，进行最后的前端页面渲染工作  

如果在 backend-access 中看不到对 Guzzle 的跟踪怎么办？（有可能会遇到这种情况）  

``sh
# 进入到 backend-access 容器
docker exec -it backend-access bash
# 执行命令
composer dump-autoload -o
# 重启服务
docker restart backend-access
``









