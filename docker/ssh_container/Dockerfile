FROM ubuntu:latest

# info
LABEL maintainer="jerrygems"
ARG VERSION=2.0

# container setup
RUN apt update && apt upgrade -y
RUN apt install -y nano openssh-server python3 pip net-tools neofetch figlet

# starting ssh server here 
RUN echo "root:j3rry@dock2" | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
EXPOSE 22
WORKDIR ~

ENTRYPOINT service ssh start && neofetch && bash
