
# An SFTP docker

This is based on:

http://www.inanzzz.com/index.php/post/qdil/creating-a-ssh-server-with-openssh-by-using-docker-compose-and-connecting-to-it-with-php


## Usage

```sh
git clone https://github.com/choval/sftp-docker
cd sftp-docker
./build [USER] [PASS] [IMAGENAME]
```

### Example

```sh
./build myuser mypassword myuser-image
```

In docker-compose.yml

```yml
sftp-image:
  image: myuser-image
  ports:
    - "2222:22"
  networks:
    - external
  volumes:
    - /var/uploads:/home/myuser/uploads
```

