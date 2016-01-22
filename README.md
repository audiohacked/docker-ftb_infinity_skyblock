# Feed-The-Beast Infinity (Minecraft 1.7.10) in a Docker Container
It's highly recommended to pull and run a data container:
```
docker pull audiohacked/minecraft_datastore
docker run --name ftb_infinity_datastore audiohacked/minecraft_datastore
```

Then, pull and run the server container:
```
docker pull audiohacked/ftb_infinity
docker run -d --name ftb_infinity \
    --volumes-from ftb_infinity_datastore \
    -p 25565:25565 \
    -e EULA=TRUE \
    audiohacked/ftb_infinity
```
