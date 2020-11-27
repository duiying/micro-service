<h1 align="center">
    micro-service
    <br>
</h1>

### 组成

| 描述 | 项目 |  
| :--- | :---- |
| 后台接入层【Hyperf】 | [backend-access](https://github.com/duiying/backend-access) | 
| 权限服务 【Hyperf】| [passport-service](https://github.com/duiying/passport-service) | 

### 部署

**环境检查**：首先确保你的机器上已经装好 Swoole、PHP、Docker、Composer，比如我的 MacBook 的环境如下：  

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

**端口检查**：确保你的机器上的 9501（backend-access）、9510（passport-service）、6397（Redis 容器）、3360（MySQL 容器）未被占用。 

1、下载

```sh
git clone https://github.com/duiying/micro-service
```

2、初始化
```sh
./init.sh
```

3、容器编排
```sh
docker-compose up -d
```

5、hosts 新增下面两行
```sh
127.0.0.1 admin.micro.service.com 
127.0.0.1 api.micro.service.com
```
6、导入 SQL（sql.sql）  

7、访问：http://admin.micro.service.com （邮箱：admin@gmail.com 密码：123456）