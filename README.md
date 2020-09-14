<h1 align="center">
    Learner
    <br>
</h1>

### 组成

| 描述 | 项目 |  
| :--- | :---- |
| 后台接入层 | [backend-access](https://github.com/duiying/backend-access) | 
| 权限服务 | [passport-service](https://github.com/duiying/passport-service) | 

### 预览

### 部署

1、下载

```sh
git clone https://github.com/duiying/Learner.git
```

2、初始化
```sh
./init.sh
```

3、容器编排
```sh
docker-compose up -d
```

4、启动服务
```sh
./server_start.sh
```

5、hosts 新增下面两行
```sh
127.0.0.1 api.admin.learner.pythonup.cn
127.0.0.1 admin.learner.pythonup.cn
```
6、导入 SQL（sql.sql）  

7、访问：http://admin.learner.pythonup.cn （邮箱：admin@gmail.com 密码：123456）