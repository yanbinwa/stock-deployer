#!/bin/bash

WORK_PATH=$(dirname "$0")
source ${WORK_PATH}/deploy-utils.sh

# source dev.env
refresh_env ${WORK_PATH}/dev.env

# replace docker-compose.yml
gen_yaml $WORK_PATH $WORK_PATH

# execute docker compose
docker-compose -f $MODULE_YAML down
