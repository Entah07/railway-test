FROM debian:bookworm-slim

RUN apt update && apt install -y \
    openssh-server \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-e"]
