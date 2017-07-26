FROM alpine

RUN apk update; apk add --no-cache nfs-utils
CMD set -x ; \
    mount "${NFS_PORT_2049_TCP_ADDR}":/exports /mnt -o nolock ; \
    ls -la /mnt ; \
    umount /mnt ; \
    echo "umount ok"

