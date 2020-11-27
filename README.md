<h1 align="center">
    micro-service
    <br>
</h1>

### 组成

| 描述 | 项目 |  
| :--- | :---- |
| 后台接入层【Hyperf】 | [backend-access](https://github.com/duiying/backend-access) | 
| 权限服务 【Hyperf】| [passport-service](https://github.com/duiying/passport-service) | 

### 架构图



### 部署

1、环境检查：首先确保你的机器上已经装好 Swoole、PHP、Docker、Composer，比如我的 MacBook 的环境如下：  

```sh
# 查看 PHP 版本
$ php -v
PHP 7.3.11 (cli) (built: Feb 29 2020 18:33:51) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.3.11, Copyright (c) 1998-2018 Zend Technologies

# 查看 Swoole 扩展
$ php --ri swoole

swoole

Swoole => enabled
Author => Swoole Team <team@swoole.com>
Version => 4.5.1
Built => May 19 2020 23:23:10
coroutine => enabled
kqueue => enabled
rwlock => enabled
pcre => enabled
zlib => 1.2.11
async_redis => enabled

Directive => Local Value => Master Value
swoole.enable_coroutine => On => On
swoole.enable_library => On => On
swoole.enable_preemptive_scheduler => Off => Off
swoole.display_errors => On => On
swoole.use_shortname => Off => Off
swoole.unixsock_buffer_size => 262144 => 262144

# 查看 Docker 及 Docker-Compose 版本
$ docker -v
Docker version 19.03.8, build afacb8b
$ docker-compose -v
docker-compose version 1.25.5, build 8a1c60f6

# 查看 Composer
$ composer --version
Composer version 1.10.6 2020-05-06 10:28:10
```

2、端口检查：确保你的机器上的 80（Nginx 容器）、9501（backend-access）、9510（passport-service）、6397（Redis 容器）、3360（MySQL 容器）未被占用。 

3、下载

```sh
git clone https://github.com/duiying/micro-service
```

4、初始化
```sh
./init.sh
```

5、容器编排
```sh
docker-compose up -d
```

6、hosts 新增下面内容
```sh
127.0.0.1 admin.micro.service.com 
127.0.0.1 api.micro.service.com
127.0.0.1 passport.micro.service.com
```

7、通过宿主机的 3360 端口（宿主机的 3360 端口映射 MySQL 容器暴露的 3306 端口）连接 MySQL 容器，导入 SQL（sql.sql）。（**如何连接**？可以使用 Navicat 等客户端工具，host 为 127.0.0.1，port 为 3360，用户名为 root，密码为 wyx**WYX123）    

8、访问：http://admin.micro.service.com（邮箱：admin@gmail.com 密码：123456）