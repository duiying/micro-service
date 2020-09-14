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

```sh
# 下载
git clone https://github.com/duiying/Learner.git
# 初始化
sh init.sh
# 容器编排
docker-compose up -d
# hosts 新增下面两行
127.0.0.1 api.admin.learner.pythonup.cn
127.0.0.1 admin.learner.pythonup.cn
# 导入 SQL（sql.sql）
# 访问
http://admin.learner.pythonup.cn
```