<h1 align="center">
    micro-service
    <br>
</h1>

### 组成

| 描述 | 项目 |  
| :--- | :---- |
| 后台接入层【Hyperf】 | [backend-access](https://github.com/duiying/backend-access) | 
| 权限服务 【Hyperf】| [passport-service](https://github.com/duiying/passport-service) | 

### 整体架构

架构图：  

<div align=center><img src="https://raw.githubusercontent.com/duiying/micro-service/master/img/micro-service.png" width="500"></div>   

架构解释：  

- backend-access 作为后台接入层，主要有两个作用：1、渲染前端页面；2、后台 API 的统一入口。
- admin.micro.service.com api.micro.service.com 这两个域名都指向 backend-access 项目，两个域名是为了区分客户端请求是「渲染视图」还是「前端调用 API 接口」。
- backend-access 通过 HTTP RPC 的方式和其他服务（如后台权限服务 passport-service）完成通信。
- 为了方便测试，给 passport-service 也分配了一个域名：passport.micro.service.com，可以通过该域名直接访问 passport-service 提供的 API 接口。  

容器架构：  

<div align=center><img src="https://raw.githubusercontent.com/duiying/micro-service/master/img/docker-model.png" width="500"></div>   

以登录流程为例，分析系统的整个处理流程：  



### 如何部署

[如何部署](./docs/如何部署.md)