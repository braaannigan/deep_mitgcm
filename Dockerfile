FROM ubuntu:18.04
WORKDIR /app
RUN apt-get -y update && apt-get -y install make gfortran vim
