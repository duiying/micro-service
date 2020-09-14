#!/usr/bin/env bash

# 创建目录
mkdir www

# 进入目录
cd www

# 下载项目
git clone https://github.com/duiying/backend-access && composer install
git clone https://github.com/duiying/passport-service && composer install

