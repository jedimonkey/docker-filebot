# Ubuntu Base
FROM java:8
MAINTAINER Marcus Collier "dev@mjcollier.id.au"

# Install some base line functionality (php5 is used by one of my random scripts)
RUN apt-get update && apt-get install -y php5-cli

# Get filebot and install
RUN wget -O /tmp/filebot.deb "https://www.filebot.net/download.php?mode=s&type=deb&arch=amd64"; \
	dpkg -i /tmp/filebot.deb; \
	rm /tmp/filebot.deb;

# Add main volume
VOLUME /share
# Add a seperate volume so filebot cache is persistent
VOLUME /home/docker

# Set up unprivileged user
RUN useradd -u 1000 -s /bin/bash docker
USER docker
ENV HOME /home/docker

CMD ["/usr/bin/filebot"]
