# audio
gst-launch-1.0 -v udpsrc port=9021 caps="application/x-rtp,clock-rate=16000" ! rtpjitterbuffer ! rtpL16depay ! audioconvert ! autoaudiosink sync=false


# 合併
# gst-launch-1.0 -v \
#   udpsrc port=9020 caps="application/x-rtp" ! \
#     rtpjitterbuffer drop-on-latency=true latency=20 ! rtph264depay ! \
#     h264parse ! avdec_h264 ! videoconvert ! queue ! autovideosink sync=false \
#   udpsrc port=9021 caps="application/x-rtp,clock-rate=16000" ! \
#     rtpjitterbuffer ! rtpL16depay ! audioconvert ! queue ! autoaudiosink sync=false


