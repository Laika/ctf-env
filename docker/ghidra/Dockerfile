FROM ubuntu:22.04

ENV SHELL /bin/bash

RUN apt-get update && apt-get install --no-install-recommends -y \
    wget \
    ca-certificates \
    sudo \
    python3 \
    libssl-dev \
    unzip \
    openjdk-17-jdk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --quiet --shell /bin/bash --gecos"" --disabled-password ghidra \
    && chown -R ghidra:ghidra /home/ghidra \
    && echo "ghidra ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/01-ghidra \
    && chmod 0440 /etc/sudoers.d/01-ghidra

COPY scripts/install_ghidra.sh /tmp/install_ghidra.sh
RUN chmod +x /tmp/install_ghidra.sh
USER ghidra
RUN /tmp/install_ghidra.sh

USER root
COPY scripts/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

COPY scripts/run_ghidra.sh /tmp/run_ghidra.sh
RUN chmod +x /tmp/run_ghidra.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ["/tmp/run_ghidra.sh"]
