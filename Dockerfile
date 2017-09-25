FROM rocker/r-base
# VOLUME DATA PATH
ENV DATA_PATH /data
RUN apt-get update -qq && \
    apt-get install -yqq xz-utils jq r-cran-ggplot2 r-cran-data.table curl
RUN curl https://api.github.com/repos/TheTorProject/ooni-sync/releases/latest \
    | grep 'browser_download_url.*linux' | cut -d '"' -f 4 | wget -i - && \
    tar xf *.gz && \
    cp ooni-sync /usr/local/bin
RUN mkdir -p ${DATA_PATH}
VOLUME ${DATA_PATH}
WORKDIR ${DATA_PATH}
ENTRYPOINT ["/bin/bash"]
