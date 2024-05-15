FROM archlinux:latest 

WORKDIR /minecraft


ENV MINECRAFT_SERVER_URL https://piston-data.mojang.com/v1/objects/145ff0858209bcfc164859ba735d4199aafa1eea/server.jar

# Update the mirror
RUN echo 'Server = http://mirror.rackspace.com/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
# install required packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm jre-openjdk wget

RUN wget ${MINECRAFT_SERVER_URL} -O minecraft_server.jar

# Copy the server.properties file into the image
COPY server.properties .

RUN echo "eula=true" > eula.txt

EXPOSE 25565

# Start the Minecraft server
ENTRYPOINT [ "java" ]

CMD ["-Xmx1024M", "-Xms1024M", "-jar", "minecraft_server.jar", "nogui"]


