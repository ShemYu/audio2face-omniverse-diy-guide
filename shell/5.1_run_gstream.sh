# install gst-launch-1.0
sudo apt-get install gst-launch-1.0
sudo apt install gstreamer1.0-rtsp gstreamer1.0-tools


# 虛擬螢幕版本
# install x
sudo apt update
sudo apt install xvfb

# Set up the display
Xvfb :99 -screen 0 1920x1080x24 &
export DISPLAY=:99

# install stream for x11vnc
sudo apt install x11vnc


# video, 注意，必須透過 DISPLAY 參數來設定串流到虛擬屏幕 :99
gst-launch-1.0 -v udpsrc port=9020 caps="application/x-rtp" ! rtpjitterbuffer drop-on-latency=true latency=20 ! rtph264depay ! h264parse ! avdec_h264 ! videoconvert ! queue ! autovideosink sync=false
# gst-launch-1.0 -v udpsrc port=9020 caps="application/x-rtp" ! rtpjitterbuffer drop-on-latency=true latency=20 ! rtph264depay ! h264parse ! avdec_h264 ! videoconvert ! queue ! tcpclientsink host=0.0.0.0 port=30000
 