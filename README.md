# minecraft-docker

## build

````sh
docker build -t minecraft .


for ARM cpu

```
docker build -t minecraft --platform linux/amd64 .
```

## create volume

```sh
docker volume create minecraft-data
````

## run

```
docker run -d -p 25565:25565 -v minecraft-data:/minecraft --name minecraft minecraft
```
