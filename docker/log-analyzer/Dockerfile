FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        procps \
        curl \
        vim \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/scripts

COPY scripts/log_analyzer.sh .

RUN chmod +x log_analyzer.sh

CMD ["./log_analyzer.sh"]