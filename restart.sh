#!/usr/bin/env bash

if [ $# -eq 0 ];then
	echo "必须提供参数 : backend-access | passport-service "
else
  docker restart $1
fi