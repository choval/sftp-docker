
# An SFTP docker

This is based on:

http://www.inanzzz.com/index.php/post/qdil/creating-a-ssh-server-with-openssh-by-using-docker-compose-and-connecting-to-it-with-php


## TODO

The image doesn't handle signals, for example when you send a docker-compose stop.
And is instead killed.

## Usage


### With docker-compose

In .env

```
SSH_MASTER_USER=username
SSH_MASTER_PASS=password
```


In docker-compose.yml

```yml
version: '3'

services:
  sftp:
    build:
      context: https://github.com/choval/sftp-docker.git
      args:
        SSH_MASTER_USER: ${SSH_MASTER_USER}
        SSH_MASTER_PASS: ${SSH_MASTER_PASS}
    hostname: sftp
    container_name: sftp
    ports:
      - "2222:22"
```

### If you need an image

(not recommended)

```sh
git clone https://github.com/choval/sftp-docker
cd sftp-docker
./build [USER] [PASS] [IMAGENAME]
```

