# Copyright 2015 Sean Nelson <audiohacked@gmail.com>
FROM java:8-jre
MAINTAINER Sean Nelson <audiohacked@gmail.com>

ENV BASE_URL="http://ftb.cursecdn.com/FTB2/modpacks/FTBInfinityEvolvedSkyblock"
ENV FTB_VERSION="1_2_0"
ENV SERVER_FILE="FTBInfinityEvolvedSkyblockServer.zip"
ENV SERVER_PORT 25565

WORKDIR /minecraft

USER root
COPY CheckEula.sh /minecraft/
RUN useradd -m -U minecraft && \
    mkdir -p /minecraft/world && \
    curl -SLO ${BASE_URL}/${FTB_VERSION}/${SERVER_FILE}  && \
    unzip ${SERVER_FILE} && \
    chmod u+x FTBInstall.sh ServerStart.sh CheckEula.sh && \
    rm eula.txt && \
    sed -i '2i /bin/sh /minecraft/CheckEula.sh' /minecraft/ServerStart.sh && \
    chown -R minecraft:minecraft /minecraft

USER minecraft
WORKDIR /minecraft
RUN ./FTBInstall.sh
EXPOSE ${SERVER_PORT}
VOLUME ["/minecraft/world"]

CMD ["/bin/sh", "./ServerStart.sh"]
