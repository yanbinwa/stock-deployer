#!/bin/bash

function gen_yaml() {
    BASE_YAML_PATH=$1
    OUTPUT_PATH=$2

    set -e

    SOURCE_MODULE_YAML=$BASE_YAML_PATH/module.yaml

    export MODULE_YAML=$OUTPUT_PATH/.module.yaml
    cp $SOURCE_MODULE_YAML $MODULE_YAML

    set +e
}

function refresh_env() {
    WORK_PATH=$(dirname "$0")
    ENV_FILE=$1
    set -o allexport
    source $1
    set +o allexport
}
