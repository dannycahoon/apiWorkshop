# Run Chrome in a container
#
# docker run -it \
#	--net host \ # may as well YOLO
#	--cpuset-cpus 0 \ # control the cpu
#	--memory 512mb \ # max memory it can use
#	-v /tmp/.X11-unix:/tmp/.X11-unix \ # mount the X11 socket
#	-e DISPLAY=unix$DISPLAY \
#	-v $HOME/Downloads:/root/Downloads \
#	-v $HOME/.config/google-chrome/:/data \ # if you want to save state
#	--device /dev/snd \ # so we have sound
#	-v /dev/shm:/dev/shm \
#	--name chrome \
#	jess/chrome
#

# Base docker image
FROM debian:sid
MAINTAINER Jessica Frazelle <jess@docker.com>

# Set Env Variables for Oracle Proxy servers
ENV http_proxy=http://www-proxy.us.oracle.com:80 HTTP_PROXY=http://www-proxy.us.oracle.com:80 https_proxy=http://www-proxy.us.oracle.com:80  HTTPS_PROXY=http://www-proxy.us.oracle.com:80 no_proxy=localhost,127.0.0.1,.us.oracle.com,.oraclecorp.com NO_PROXY=localhost,127.0.0.1,.us.oracle.com,.oraclecorp.com
 
# Install Chrome
RUN echo 'deb http://httpredir.debian.org/debian testing main' >> /etc/apt/sources.list && \
	apt-get update && apt-get install -y \
	ca-certificates \
	curl \
	hicolor-icon-theme \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libv4l-0 \
	-t testing \
	fonts-symbola \
        libexif12 \
	--no-install-recommends \
	&& curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
	&& apt-get update && apt-get install -y \
	google-chrome-stable \
	--no-install-recommends \
	&& apt-get purge --auto-remove -y curl \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /src/*.deb

COPY local.conf /etc/fonts/local.conf

# Autorun chrome
ENTRYPOINT [ "google-chrome" ]
CMD [ "--user-data-dir=/data" ]

