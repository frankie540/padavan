#!/bin/sh
#创建运行环境
killall frpc
mkdir -p /tmp/frp

#创建frpc配置文件
cat > "/tmp/frp/myfrpc.ini" <<-\EOF
# ==========客户端配置：==========

log_file = /tmp/frpc.log
log_level = info
log_max_days = 1


# 新加坡-新加坡-新加坡800M
[common]
server_addr = sg.sg.sgserver.hay-frp.org
server_port = 8000
tcp_mux = true
protocol = tcp
tls_enable = false
user = 71alwQtNHPHBsriq
token = HayFrpToken

# 隧道 #12242 的配置文件(上次更新于 2025-01-13 23:06)
[Frankieyc1]
privilege_mode = true
type = tcp
local_ip = 192.168.100.1
local_port = 80
remote_port = 54023
use_encryption = true
use_compression = true


# ================================
EOF

#启动程序
frpc_enable=`nvram get frpc_enable`
if [ "$frpc_enable" = "1" ] ; then
    frpc -c /tmp/frp/myfrpc.ini 2>&1 &
fi
