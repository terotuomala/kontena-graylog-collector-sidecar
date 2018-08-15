FROM debian:9.5-slim as build

WORKDIR /graylog-collector-sidecar

# Set collector-sidecar dep-package download url
ENV COLLECTOR_SIDECAR_URL https://github.com/Graylog2/collector-sidecar/releases/download/0.1.6/collector-sidecar_0.1.6-1_amd64.deb

# Updata repositories and install curl
RUN apt-get update && apt-get install curl ca-certificates -y --no-install-recommends

# Download collector-sidecar and remove curl
RUN curl -Lo collector-sidecar_0.1.6-1_amd64.deb ${COLLECTOR_SIDECAR_URL} && \
    apt-get purge -y --auto-remove curl

# Copy collector-sidecar config
COPY ./config/collector_sidecar.yml .

FROM ubuntu:18.04

WORKDIR /graylog-collector-sidecar

# Copy files from build stage
COPY --from=build /graylog-collector-sidecar .

# Install collector-sidecar and remove the .deb file
RUN dpkg -i collector-sidecar_0.1.6-1_amd64.deb && \
    rm collector-sidecar_0.1.6-1_amd64.deb
