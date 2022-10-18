FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y curl python3
ADD https://github.com/ncbi/sra-human-scrubber/releases/download/2.0.0/sra-human-scrubber-2.0.0.tar.gz /opt/
RUN cd /opt/ && \
    tar xzvf sra-human-scrubber-2.0.0.tar.gz && \
    mv sra-human-scrubber-2.0.0 scrubber
RUN /opt/scrubber/init_db.sh
ENV PATH="/usr/bin:/opt/scrubber/bin:/opt/scrubber/scripts:${PATH}"
RUN ldconfig
RUN /opt/scrubber/scripts/scrub.sh -p 6 -t