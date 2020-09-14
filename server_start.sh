#!/usr/bin/env bash

echo "========================= backend-access 启动 begin =======================+======================================"
docker exec -i backend-access bash -c 'composer update'
docker exec -d backend-access bash -c 'php bin/hyperf.php start'
echo "========================= backend-access 启动 end =====================+=========================================="

echo "========================= passport-service 启动 begin ==============+============================================="
docker exec -i passport-service bash -c 'composer update'
docker exec -d passport-service bash -c 'php bin/hyperf.php start'
echo "========================= passport-service 启动 end ===================+=========================================="