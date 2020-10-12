#!/bin/bash

WORK_PATH=$(dirname "$0")
source ${WORK_PATH}/deploy-utils.sh

# source dev.env
refresh_env ${WORK_PATH}/dev.env

# replace docker-compose.yml
gen_yaml $WORK_PATH $WORK_PATH

# 创建volume 目录
mountdir=`cat $MODULE_YAML | grep infrastructure | grep -v '#'`
for i in $mountdir
do
  if [[  `ls -al ${DEPLOY_PATH} | grep infrastructure | awk '{print $4}'` == "root" ]];then
      continue
  fi
  if [[ $i =~ "infrastructure" ]] && [[ ! -d $i ]] ;then
      mkdir -p ${i%%:*}
  fi
done

# execute docker compose
docker-compose -f $MODULE_YAML up -d
