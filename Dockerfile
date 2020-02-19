#Download base image ubuntu 18.04
FROM ubuntu:18.04

# Update Software repository
RUN apt-get update

COPY app /home/ubuntu/app

COPY environment /home/ubuntu/environment

RUN apt-get install sudo

# Run provision script
COPY provision.sh /provision.sh
RUN ./provision.sh

EXPOSE 80 443 3000
