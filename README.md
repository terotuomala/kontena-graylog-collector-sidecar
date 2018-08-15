# Graylog-collector-sidecar for Kontena environment
Kontena Stack for gathering log-files from nodes to Graylog using collector-sidecar.

### Prerequisites
Graylog server up and running. Collector-sidecar receives it's configuration from Graylog server, so it is essential that the matching configuration exists in the server side.

### Usage with Kontena
The stack uses (and asks during the installation) the following environment variables to define [global configuration options](http://docs.graylog.org/en/2.4/pages/collector_sidecar.html#configuration) for Filebeat:

- SERVER_URL
- UPDATE_INTERVAL
- TLS_SKIP_VERIFY
- SEND_STATUS
- LIST_LOG_FILES
- NODE_ID
- COLLECTOR_ID
- LOG_PATH
- LOG_ROTATION_TIME
- LOG_MAX_AGE
- TAGS

In order to monitor folder(s) from the host machine, they need to be mounted to the container. By default only one folder can be mounted automatically during the installation. If more folders are required they can be added to the `volumes` section in the `kontena.yml` file.

### Installation
```
kontena stack install
```
