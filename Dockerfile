FROM debian:stable-slim

LABEL author="Ali Khalil <ali.khalil@gmail.com>"
ENTRYPOINT ["/opt/setup-environment.sh"]
VOLUME ["/output"]

# Update existing packages and install new ones
# But, first add GPG key for Nginx PPA repository
RUN apt-get -q update && \
  apt-get install -qy \
    xvfb \
    ratpoison \
    tigervnc-viewer \
    ffmpeg \
    && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /var/cache/apt/*.bin /tmp/*

COPY setup-environment.sh /opt/setup-environment.sh
COPY capture-vnc.sh /opt/capture-vnc.sh
