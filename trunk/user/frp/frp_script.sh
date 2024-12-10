#!/bin/sh
#创建运行环境
killall frpc
mkdir -p /tmp/frp

#创建frpc配置文件
cat > "/tmp/frp/myfrpc.ini" <<-\EOF
# ==========客户端配置：==========

[common]
server_addr = frp.104300.xyz
server_port = 7000
token = www.126126.xyz

[frankiept01]
type = tcp
local_ip = 192.168.100.1
local_port = 80
remote_port = 54023
use_encryption = true
use_compression = true

log_file = /tmp/frpc.log
log_level = info
log_max_days = 3

# ================================
EOF

#启动程序
frpc_enable=`nvram get frpc_enable`
if [ "$frpc_enable" = "1" ] ; then
    frpc -c /tmp/frp/myfrpc.ini 2>&1 &
fi
