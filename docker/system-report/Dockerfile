FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    iproute2 net-tools procps curl vim \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/scripts

COPY scripts/system_report.sh .

RUN chmod +x system_report.sh

CMD ["./system_report.sh"]