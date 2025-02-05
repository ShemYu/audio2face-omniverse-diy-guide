#!/bin/bash

# 检查是否已安装nginx
if ! command -v nginx &> /dev/null; then
    echo "正在安装 nginx..."
    sudo apt update
    sudo apt install -y nginx
    sudo apt install -y libnginx-mod-rtmp
fi

# 创建nginx配置文件
sudo cat > /etc/nginx/nginx.conf << EOF
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
    worker_connections 1024;
}

# RTMP 配置
rtmp {
    server {
        listen 1935;
        chunk_size 4096;

        application live {
            live on;
            idle_streams on;
            record off;
            
            # 允许所有来源的推流
            allow publish all;
            
            # 允许所有来源的播放
            allow play all;
        }
    }
}

http {
    include mime.types;
    default_type application/octet-stream;
    sendfile on;
    keepalive_timeout 65;

    server {
        listen 80;
        
        location /stat {
            rtmp_stat all;
            rtmp_stat_stylesheet stat.xsl;
        }
    }
}
EOF

# 重启nginx服务
sudo systemctl restart nginx

echo "Nginx RTMP 服务器已启动"
echo "RTMP 推流地址: rtmp://localhost/live"

# Command cheat sheet
# sudo systemctl stop nginx
# sudo systemctl start nginx
# sudo systemctl restart nginx
# sudo systemctl status nginx