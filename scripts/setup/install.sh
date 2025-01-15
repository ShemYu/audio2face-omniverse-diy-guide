sudo apt update

# 系統依賴
sudo apt install -y \
    pkg-config \
    cmake \
    libcap2 \
    libcap-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    liblog4cplus-dev

# Gstreamer 依賴
sudo apt install -y \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    gstreamer1.0-gl \
    gstreamer1.0-pulseaudio \
    gstreamer1.0-alsa \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    gstreamer1.0-plugins-base-apps

# 音訊依賴
sudo apt install -y \
    alsa-utils \
    pulseaudio

# 視訊依賴
sudo apt install -y mesa-utils

# X虛擬顯示器
sudo apt install -y xvfb
# Xvfb :99 -screen 0 1024x768x24 &
# export DISPLAY=:99

# VNC遠端桌面
sudo apt install -y x11vnc
# x11vnc -display :99 -noxdamage -forever -shared &

# /home/ubuntu/audio2face/audio2face-omniverse-diy-guide/amazon-kinesis-video-streams-webrtc-sdk-c/build

