FROM r-base:3.5.3

# VOLUME DATA PATH
ENV DATA_PATH /data

RUN apt-get update -qq && \
    apt-get install -y xz-utils jq r-cran-ggplot2 r-cran-data.table wget
RUN wget https://github.com/TheTorProject/ooni-sync/releases/download/v1.3/ooni-sync_1.3_linux_amd64.tar.gz
RUN tar xvf ooni-sync_1.3_linux_amd64.tar.gz && \
    cp ooni-sync /usr/local/bin
RUN mkdir -p ${DATA_PATH}

VOLUME ${DATA_PATH}
WORKDIR ${DATA_PATH}

ENTRYPOINT ["/bin/bash"]
