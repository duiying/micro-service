#!/usr/bin/env bash

# 创建目录
if [ ! -d www ]; then
	mkdir www
fi

# 进入目录
cd www

# 下载项目
if [ -d backend-access ]; then
	cd backend-access
	git pull origin master
	composer install
else
	git clone https://github.com/duiying/backend-access && cd backend-access && composer install
fi

if [ -d passport-service ]; then
	cd passport-service
        git pull origin master
        composer install
else
	git clone https://github.com/duiying/passport-service && cd passport-service && composer install
fi

