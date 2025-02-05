#!/bin/bash

# 检查是否已安装ffmpeg
# if ! command -v ffmpeg &> /dev/null; then
#     echo "正在安装 ffmpeg..."
#     sudo apt update
#     sudo apt install -y ffmpeg
# fi

# 执行 ffmpeg 流转换
# 注意：在bash中使用 \ 换行时，后面不能有注释，必须直接换行
# 增加音频采样率和比特率以提升音质
ffmpeg -i rtmp://localhost/live/test \
    -vf "scale=640:360" \
    -c:v libx264 \
    -preset ultrafast \
    -tune zerolatency \
    -b:v 1000k \
    -maxrate 1000k \
    -bufsize 2000k \
    -c:a aac \
    -ar 16000 \
    -b:a 32k \
    -async 1 \
    -vsync 1 \
    -f flv rtmp://localhost/live


ffmpeg -i rtmp://localhost/live/test \
    -vf "scale=640:360" \
    -c:v libx264 \
    -preset ultrafast \
    -tune zerolatency \
    -b:v 800k \
    -maxrate 800k \
    -bufsize 1600k \
    -c:a aac \
    -ar 16000 \
    -b:a 32k \
    -async 1 \
    -vsync 1 \
    -shortest \
    -f flv rtmp://localhost/live

# 可以使用以下命令检查音频参数:
# ffprobe rtmp://localhost/live