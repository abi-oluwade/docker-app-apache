#Download base image ubuntu 18.04
FROM ubuntu:18.04

# Update Software repository
RUN apt-get update

COPY . /app

COPY . /environment

RUN apt-get install sudo

# Configure Services and Port
COPY provision.sh /provision.sh
CMD ["./provision.sh"]

EXPOSE 80 443 3000
