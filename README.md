# Feed-The-Beast Infinity Evolved Skyblock (Minecraft 1.7.10) in a Docker Container
It's highly recommended to run a named data volume:
```
docker volume create minecraft_ftb_infinity_skyblock_data
```

Then, pull and run the server container:
```
docker pull audiohacked/ftb_infinity_skyblock:stable
docker run --detach --interactive --tty \
    --name ftb_infinity_skyblock \
    --volume minecraft_ftb_infinity_skyblock_data:/minecraft/world \
    --publish 25565:25565 \
    --env EULA=TRUE \
    audiohacked/ftb_infinity_skyblock:stable
```
