#!/usr/bin/env bash

docker exec -it backend-access bash -c 'composer update && php bin/hyperf.php start'
docker exec -it passport-service bash -c 'composer update && php bin/hyperf.php start'