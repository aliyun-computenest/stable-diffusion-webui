#!/bin/bash

# 基础启动参数
ARGS="--ckpt-dir ./ckpts --listen --port 7680 --enable-insecure-extension-access --disable-safe-unpickle --api --xformers --skip-install"

# 检查是否设置了密码
if [ -n "$API_PASSWORD" ] && [ "$API_PASSWORD" != "" ]; then
    echo "启用API认证，用户名: admin"
    ARGS="$ARGS --api-auth admin:$API_PASSWORD"
else
    echo "未设置密码，禁用API认证"
fi

echo "启动参数: $ARGS"
python -u ./launch.py $ARGS
