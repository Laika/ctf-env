FROM ubuntu:22.04

ENV SHELL /bin/bash

RUN apt-get update && apt-get install --no-install-recommends -y \
    wget \
    ca-certificates \
    build-essential \
    gfortran \
    automake \
    m4 \
    dpkg-dev \
    sudo \
    python3 \
    libssl-dev \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --quiet --shell /bin/bash --gecos"" --disabled-password sage \
    && chown -R sage:sage /home/sage \
    && echo "sage ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/01-sage \
    && chmod 0440 /etc/sudoers.d/01-sage

COPY scripts/install_sage.sh /tmp/install_sage.sh
RUN chmod +x /tmp/install_sage.sh
USER sage
RUN /tmp/install_sage.sh


USER root
COPY scripts/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

RUN mkdir -p /sage-scripts && chown -R sage:sage /sage-scripts
WORKDIR /sage-scripts

ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["/usr/bin/sage"]
