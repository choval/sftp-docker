# Copied from
# http://www.inanzzz.com/index.php/post/qdil/creating-a-ssh-server-with-openssh-by-using-docker-compose-and-connecting-to-it-with-php
FROM debian:latest
 
ARG SSH_MASTER_USER
ARG SSH_MASTER_PASS
 
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    vim \
    sudo \
    openssh-server
 
COPY ssh_config /etc/ssh/ssh_config
COPY sshd_config /etc/ssh/sshd_config
 
COPY user.sh /usr/local/bin/user.sh
RUN chmod +x /usr/local/bin/user.sh
RUN /usr/local/bin/user.sh
 
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN mkdir /var/run/sshd
 
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
 
CMD tail -f /dev/null
