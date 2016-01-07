# Copyright 2015 Sean Nelson <audiohacked@gmail.com>
FROM java:7-jre
MAINTAINER Sean Nelson <audiohacked@gmail.com>

ARG BASE_URL="http://ftb.cursecdn.com/FTB2/modpacks/FTBInfinity"
ARG FTB_VERSION="2_3_3"
ARG SERVER_FILE="FTBInfinityServer.zip"
ENV SERVER_PORT 25565

WORKDIR /minecraft

USER root
COPY CheckEula.sh /minecraft/
# RUN apt-get update && apt-get install -y tmux
RUN \
    groupadd -r minecraft && \
    useradd -r -m -g minecraft minecraft && \
    mkdir -p /minecraft/world && \
    chown -R minecraft:minecraft /minecraft && \
    curl -SLO ${BASE_URL}/${FTB_VERSION}/${SERVER_FILE}  && \
    unzip ${SERVER_FILE} && \
    chmod u+x FTBInstall.sh ServerStart.sh CheckEula.sh && \
    rm eula.txt && \
    sed -i '2i /bin/bash /minecraft/CheckEula.sh' /minecraft/ServerStart.sh && \
    /minecraft/FTBInstall.sh

USER minecraft
EXPOSE ${SERVER_PORT}
VOLUME ["/minecraft/world"]

# CMD tmux new -s minecraft -d /home/minecraft/ServerStart.sh
CMD ["/bin/bash", "/minecraft/ServerStart.sh"]
