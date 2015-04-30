# Ubuntu Base
FROM ubuntu
MAINTAINER Marcus Collier "marcus@mjcollier.id.au"

# Install some base line functionality (php5 is used by one of my random scripts)
RUN apt-get update && apt-get -y upgrade && apt-get install -y python-software-properties \
	software-properties-common \
	php5-cli

# Install java 8
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update && apt-get install -y oracle-java8-installer
RUN update-alternatives --display java

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
