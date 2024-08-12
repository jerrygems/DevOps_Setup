FROM debian:latest

# info
LABEL maintainer="jerrygems"
ARG VERSION=1.0

RUN apt update -y && apt upgrade -y
RUN apt install python3 wget -y
WORKDIR /root
RUN wget https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz
RUN tar xvf node_exporter*
RUN rm ./*tar.gz
RUN cd node_exporter* 

EXPOSE 3000/tcp
EXPOSE 8000/tcp
EXPOSE 9100/tcp
ENTRYPOINT ~/node_exporter & 2>/dev/null && clear && hostname -i && bash 
