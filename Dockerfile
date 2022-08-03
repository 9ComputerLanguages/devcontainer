FROM ubuntu:20.04

ENV LANG ja_JP.UTF-8
ENV TZ Asia/Tokyo
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
  && yes | unminimize \
  && apt-get install -y \
  fonts-noto-cjk \
  gawk \
  git \
  man \
  sudo \
  vim \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*

ARG USERNAME=9sako6
ARG GROUPNAME=user
ARG UID=9356
ARG GID=9356
ARG PASSWORD=user
RUN groupadd -g ${GID} ${GROUPNAME} \
  && useradd -m -s /bin/bash -u ${UID} -g ${GID} -G sudo ${USERNAME} \
  && echo ${USERNAME}:${PASSWORD} | chpasswd \
  && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${UID}

WORKDIR /workdir
