#!/bin/bash




gst-launch-1.0 -v \
  udpsrc port=9020 caps="application/x-rtp,media=video,encoding-name=H264,payload=96" \
    ! rtpjitterbuffer latency=50 \
    ! rtph264depay \
    ! h264parse \
    ! queue \
    ! mux. \
  udpsrc port=9021 caps="application/x-rtp,clock-rate=16000" \
    ! rtpjitterbuffer latency=50 \
    ! rtpL16depay \
    ! audioconvert \
    ! audioresample \
    ! voaacenc bitrate=32000 \
    ! aacparse \
    ! queue \
    ! mux. \
  flvmux name=mux streamable=true \
    ! rtmpsink location="rtmp://localhost/live/test"


gst-launch-1.0 -v \
  udpsrc port=9020 caps="application/x-rtp,media=video,encoding-name=H264,payload=96" \
    ! rtpjitterbuffer latency=20 \
    ! rtph264depay \
    ! queue \
    ! mux. \
  udpsrc port=9021 caps="application/x-rtp,clock-rate=16000" \
    ! rtpjitterbuffer latency=20 \
    ! rtpL16depay \
    ! audioconvert \
    ! audioresample \
    ! voaacenc bitrate=32000 \
    ! queue \
    ! mux. \
  flvmux name=mux streamable=true latency=500 \
    ! rtmpsink location="rtmp://localhost/live/test"
