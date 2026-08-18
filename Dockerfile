FROM debian:bookworm-slim

RUN apt update && \
    apt install -y openssh-server && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/sshd

RUN echo 'root:railway123' | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-e"]
