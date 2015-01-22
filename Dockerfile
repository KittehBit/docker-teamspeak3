# Version 1
# centos 7
# Teamspeak Server 3.0.11.2

FROM centos:7

MAINTAINER KittehBit <mail@kittehbit.me>

# Teamspeak Server download URL
ENV TEAMSPEAK_URL http://dl.4players.de/ts/releases/3.0.11.2/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz

# Install needed tools for this image
RUN yum -y install tar

# Download the Teamspeak tarball and place it in /installed (for future version reference)
ADD ${TEAMSPEAK_URL} /teamspeak/installed/

# extract and move it to /teamspeak
RUN cd /teamspeak/ && tar -xzf /teamspeak/installed/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz

# Expose the ports and place the entrypoint for automatic start
EXPOSE 9987/udp 10011 30033
ENTRYPOINT ["/teamspeak/teamspeak3-server_linux-amd64/ts3server_minimal_runscript.sh"]

# Setting a volume for outside access
VOLUME /teamspeak
