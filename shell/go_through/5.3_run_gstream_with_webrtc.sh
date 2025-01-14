PUBLIC_IP=3.93.61.202

gst-launch-1.0 -v \
  webrtcbin name=sendrecv signaling-server=wss://${PUBLIC_IP}:30080 stun-server=stun://${PUBLIC_IP}:3478 turn-server=turn://user:password@${PUBLIC_IP}:3478 \
  udpsrc port=9020 caps="application/x-rtp, encoding-name=H264, clock-rate=90000" ! \
    rtph264depay ! h264parse ! avdec_h264 ! videoconvert ! queue ! sendrecv. \
  udpsrc port=9021 caps="application/x-rtp, clock-rate=16000" ! \
    rtpjitterbuffer ! rtpL16depay ! audioconvert ! opusenc ! queue ! sendrecv.

gst-launch-1.0 -v \
  webrtcbin name=sendrecv stun-server=stun://stun.l.google.com:19302 \
  signaling-server=ws://3.93.61.202:8080 \
  udpsrc port=9020 caps="application/x-rtp, encoding-name=H264, clock-rate=90000" ! \
    rtph264depay ! h264parse ! queue ! rtph264pay pt=96 ! sendrecv. \
  udpsrc port=9021 caps="application/x-rtp, clock-rate=16000" ! \
    rtpjitterbuffer ! rtpL16depay ! audioconvert ! opusenc ! queue ! rtpopuspay pt=97 ! sendrecv.
