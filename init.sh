#!/usr/bin/env bash

echo "========================= 初始化脚本执行开始 ========================================================================"

# 创建目录
if [ ! -d www ]; then
	mkdir www
fi

# 进入目录
cd www

# 下载项目
echo "========================= backend-access 下载开始 ================================================================="
if [ -d backend-access ]; then
	cd backend-access
	git pull origin master
else
	git clone https://github.com/duiying/backend-access
fi
echo "========================= backend-access 下载结束 ================================================================="

echo "========================= passport-service 下载开始 ==============================================================="
if [ -d passport-service ]; then
	cd passport-service
        git pull origin master
else
	git clone https://github.com/duiying/passport-service
fi
echo "========================= passport-service 下载结束 ==============================================================="

echo "========================= content-service 下载开始 ================+==============================================="
if [ -d content-service ]; then
	cd content-service
        git pull origin master
else
	git clone https://github.com/duiying/content-service
fi
echo "========================= content-service 下载结束 =========+======================================================"

# .env
cd backend-access && cp .env.example .env && cd ..
cd passport-service && cp .env.example .env && cd ..
cd content-service && cp .env.example .env && cd ..

# 安装 Composer 包（需要启动两个 Hyperf 容器，通过目录映射，来为项目安装所需要的 Composer 包）
echo "========================= bacend-access 安装包开始 ================================================================"
docker run --name bacend-access-package-tool \
-v `pwd`/backend-access:/data/www -i --entrypoint /bin/sh -d \
registry.cn-beijing.aliyuncs.com/duiying/hyperf:1.0
docker exec -i bacend-access-package-tool bash -c 'composer update'
echo "========================= bacend-access 安装包结束 ================================================================"

echo "========================= passport-service 安装包开始 ============================================================="
docker run --name passport-service-package-tool \
-v `pwd`/passport-service:/data/www -i --entrypoint /bin/sh -d \
registry.cn-beijing.aliyuncs.com/duiying/hyperf:1.0
docker exec -i passport-service-package-tool bash -c 'composer update'
echo "========================= passport-service 安装包结束 ============================================================="

echo "========================= content-service 安装包开始 =========+===================================================="
docker run --name content-service-package-tool \
-v `pwd`/content-service:/data/www -i --entrypoint /bin/sh -d \
registry.cn-beijing.aliyuncs.com/duiying/hyperf:1.0
docker exec -i content-service-package-tool bash -c 'composer update'
echo "========================= content-service 安装包结束 =============================================================="

# 安装完 Composer 包，负责安装 Composer 包的容器的任务完成，需要删除掉这些容器
docker rm -f bacend-access-package-tool
docker rm -f passport-service-package-tool
docker rm -f content-service-package-tool

echo "========================= 初始化脚本执行结束 ========================================================================"

