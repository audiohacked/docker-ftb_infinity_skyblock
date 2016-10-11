# Feed-The-Beast Infinity Evolved Skyblock (Minecraft 1.7.10) in a Docker Container
It's highly recommended to pull and run a data container:
```
docker pull audiohacked/ftb_infinity_skyblock:1.2.0
docker run --name ftb_infinity_skyblock_datastore audiohacked/ftb_infinity_skyblock:1.2.0
```

Then, pull and run the server container:
```
docker pull audiohacked/ftb_infinity_skyblock:1.2.0
docker run -d -it --name ftb_infinity_skyblock \
    --volumes-from ftb_infinity_skyblock_datastore \
    -p 25565:25565 \
    -e EULA=TRUE \
    audiohacked/ftb_infinity_skyblock:1.2.0
```
