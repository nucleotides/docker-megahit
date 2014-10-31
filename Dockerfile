FROM debian:wheezy
MAINTAINER Michael Barton, mail@michaelbarton.me.uk

ENV PACKAGES wget make python g++ zlib1g-dev
ENV MEGAHIT_DIR /tmp/megahit
ENV MEGAHIT_TAR https://github.com/voutcn/megahit/archive/v0.1.1-beta.tar.gz

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends ${PACKAGES}

RUN mkdir ${MEGAHIT_DIR}
RUN cd ${MEGAHIT_DIR} &&\
    wget --no-check-certificate ${MEGAHIT_TAR} --output-document - |\
    tar xzf - --directory . --strip-components=1 &&\
    make

