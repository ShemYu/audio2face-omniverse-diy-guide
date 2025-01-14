# Omniverse Stream

A toolkit for managing Omniverse streaming services.

## Features

- Virtual display service management
- Omniverse stream control
- Debugging utilities

## Quick Start

### Stream Service Management

1. Start virtual display service:
```sh
Xvfb :99 -screen 0 1920x1080x24 &
export DISPLAY=:99
```

2. Start streaming:
```sh
stream_id=$(uuidgen)
curl -X POST -s http://localhost:8020/streams/$stream_id
curl -X POST -s http://localhost:8021/streams/$stream_id
```

3. Stop streaming:
```sh
curl -X DELETE -s http://localhost:8020/streams/$stream_id
curl -X DELETE -s http://localhost:8021/streams/$stream_id
```

## Debugging Guide

### Port Status Check

To check if port 9020 is open:
```sh
sudo tcpdump -n -i any port 9020
```

### Troubleshooting

1. Display Issues
   - Ensure virtual display service is running
   - Verify DISPLAY environment variable settings

2. Network Issues
   - Check if required ports are available
   - Verify firewall settings

## Requirements

- Linux OS
- Xvfb
- tcpdump (for debugging)

## License

[Add license information]

## Contributing

[How to contribute or report issues]
