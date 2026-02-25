FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    tar gzip procps curl vim \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/scripts

COPY scripts/backup.sh .

RUN chmod +x backup.sh

CMD ["./backup.sh"]