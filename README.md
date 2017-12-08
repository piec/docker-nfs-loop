Build client image:
```
docker build -t client-nfs:1 .
```

Run server:
```
docker run -it --rm --name nfs --privileged -v $PWD/exports/:/exports -p 2049:2049/tcp zadki3l/alpine-nfs-server
```

Run client in a loop:
```
while true; do
    docker run -it --rm --name client-nfs --cap-add=SYS_ADMIN --security-opt apparmor:unconfined --link nfs:nfs client-nfs:1
    sleep 1
done
```
