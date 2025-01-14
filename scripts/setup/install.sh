sudo apt update

# Gstreamer dependencies
sudo apt install -y \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    gstreamer1.0-gl \
    gstreamer1.0-pulseaudio \
    gstreamer1.0-alsa

# ALSL audio dependencies
sudo apt install -y alsa-utils pulseaudio

# MESA video dependencies
sudo apt install -y mesa-utils

# X virtual framebuffer
sudo apt install -y xvfb
# Xvfb :99 -screen 0 1024x768x24 &
# export DISPLAY=:99

# x11vnc
sudo apt install -y x11vnc
# x11vnc -display :99 -noxdamage -forever -shared &
