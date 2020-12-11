<h1 align="center">
    micro-service
    <br>
</h1>

### 特性

- 前后端分离，UI 基于 AdminLTE3，后端框架使用 Hyperf
- 基于 Redis 实现的 token 令牌机制
- 基于 Guzzle 封装的 HTTP RPC 组件、MySQL CRUD 组件、重试组件等
- 基于 ElasticSearch 的搜索功能
- 通过 RabbitMQ 将 MySQL 中的数据同步到 ElasticSearch
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

<div align=center><img src="https://raw.githubusercontent.com/duiying/micro-service/master/img/micro-service.png" width="800"></div>   

**解释**：  

- backend-access 作为后台接入层，主要有两个作用：1、渲染前端页面；2、后台 API 的统一入口。
- admin.micro.service.com api.micro.service.com 这两个域名都指向 backend-access 项目，两个域名是为了区分客户端请求是「渲染视图」还是「前端调用 API 接口」。
- backend-access 通过 HTTP RPC 的方式和其他服务（如后台权限服务 passport-service）完成通信。
- 为了方便测试，给 passport-service、content-service 也各自分配了域名：passport.micro.service.com、content.micro.service.com，可以通过该域名直接访问服务提供的 API 接口。  

**容器**：  

<div align=center><img src="https://raw.githubusercontent.com/duiying/micro-service/master/img/docker-model.png" width="800"></div>   

### 如何部署

[如何部署](./docs/如何部署.md)