#!/usr/bin/env bash

if [ $# -eq 0 ];then
	echo "必须提供参数 : backend-access | passport-service "
else
  docker exec -d $1 bash -c 'ps aux | grep 'php' |grep -v grep |awk '{print $1}' | xargs kill -TERM && php bin/hyperf.php start'
fi