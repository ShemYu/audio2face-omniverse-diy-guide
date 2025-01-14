sudo apt install gstreamer1.0-rtsp gstreamer1.0-tools
sudo apt install -y gstreamer1.0-tools gstreamer1.0-rtsp gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-python3-plugin-loader


PORT=5900

gst-launch-1.0 -v \
  udpsrc port=9020 caps="application/x-rtp, encoding-name=H264, clock-rate=90000" ! \
    rtpjitterbuffer drop-on-latency=true latency=20 ! rtph264depay ! h264parse ! rtph264pay name=pay0 pt=96 ! \
  udpsrc port=9021 caps="application/x-rtp, clock-rate=16000" ! \
    rtpjitterbuffer ! rtpL16depay ! audioconvert ! audioresample ! opusenc ! rtpopuspay name=pay1 pt=97 ! \
  rtspsink service=5900 location="rtsp://0.0.0.0:5900/stream"
