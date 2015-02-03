# Version 1.1
# Docker version 1.4.1
# CentOS 7
# Teamspeak Server 3.0.11.2

FROM centos:7

MAINTAINER KittehBit <mail@kittehbit.me>

# Teamspeak Server download URL
ENV TEAMSPEAK_URL http://dl.4players.de/ts/releases/3.0.11.2/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz

# Install the tools needed for this image
RUN yum -y install tar

# Optionally copy previous teamspeak data to the new image
COPY .teamspeak/ /teamspeak/

# Download the Teamspeak Server 3 tarball and place it in /teamspeak/installed/ (for future version reference)
ADD ${TEAMSPEAK_URL} /teamspeak/installed/

# Extract and move it to /teamspeak/
RUN cd /teamspeak/ && tar -xzf /teamspeak/installed/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz

# Expose the ports and place the entrypoint for automatic start
EXPOSE 9987/udp 10011 30033
ENTRYPOINT ["/teamspeak/teamspeak3-server_linux-amd64/ts3server_minimal_runscript.sh"]