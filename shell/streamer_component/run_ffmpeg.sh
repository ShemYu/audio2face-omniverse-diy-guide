# Input RTMP stream from local test endpoint
ffmpeg -i rtmp://localhost/live/test \
  # Scale video to 640x360 resolution
  -vf "scale=640:360" \
  # Video codec settings: H.264 with low-latency configuration
  -c:v libx264 -preset ultrafast -tune zerolatency \
  # Video bitrate control
  -b:v 1000k -maxrate 1000k -bufsize 2000k \
  # Audio codec settings: AAC with 64kbps bitrate  
  -c:a aac -b:a 64k \
  # Output format and destination
  -f flv rtmp://localhost/live