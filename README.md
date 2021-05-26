# Capture VNC Session to MP4

```bash
docker build -t capture-vnc .
docker run --rm -ti -e VNC_HOST_IP=192.168.1.1 -v $PWD:/output capture-vnc
```

then inside the container

```bash
/opt/capture-vnc.sh
```

based off [how to stream or record a vnc session using ffmpeg](http://extremelygood.software/how-to-stream-or-record-a-vnc-session-using-ffmpeg.html)
