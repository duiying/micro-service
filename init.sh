#!/usr/bin/env bash

# 创建项目目录
mkdir -p /data/www

# 下载项目
cd /data/www && git clone https://github.com/duiying/backend-access && composer install
cd /data/www && git clone https://github.com/duiying/passport-service && composer install








