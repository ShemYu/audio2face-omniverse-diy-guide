# Streamer Component Scripts

This directory contains a collection of shell scripts for setting up and managing video streaming components using GStreamer, FFmpeg, and Nginx RTMP. These scripts are essential for handling video streaming in the Audio2Face Omniverse pipeline.

## Scripts Overview

### 1. GStreamer Script (`0_run_gstreamer.sh`)
- Sets up GStreamer pipeline for handling UDP video and audio streams generate by `Omniverse`(end of the animation pipeline)
- Configures video (H264) and audio (L16) input streams
- Combines streams and outputs to RTMP format
- Parameters:
  - Video port: 9020
  - Audio port: 9021
  - Output: RTMP stream (rtmp://localhost/live/test)

### 2. FFmpeg Script (`1_run_ffmpeg.sh`)
- Processes and transcodes the RTMP stream
- Provides two configuration options for different quality settings
- Features:
  - Video scaling to 640x360
  - H264 video encoding with ultrafast preset
  - AAC audio encoding
  - Configurable bitrates for both video and audio
- Input: rtmp://localhost/live/test
- Output: rtmp://localhost/live

### 3. Nginx RTMP Setup (`2_run_nginx.sh`)
- Installs and configures Nginx with RTMP module
- Sets up RTMP server configuration
- Features:
  - Automatic Nginx installation if not present
  - RTMP server listening on port 1935
  - Supports live streaming
  - Configures proper permissions and settings

## Usage

1. First, start the Nginx RTMP server:
```bash
./2_run_nginx.sh
```

2. Then, start the GStreamer pipeline:
```bash
./0_run_gstreamer.sh
```

3. Finally, run the FFmpeg transcoder:
```bash
./1_run_ffmpeg.sh
```

## Notes
- Ensure all required dependencies (GStreamer, FFmpeg, Nginx) are installed
- The scripts are designed to work together in sequence
- Default RTMP endpoints can be modified in the scripts if needed
- Monitor system resources when running all components simultaneously