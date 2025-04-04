# Need to use version number so that it gets updated here and triggers a build
# Find the current version of Python at https://www.python.org/downloads/source/
ARG PYTHON_VERSION=3.11.9
ARG DEBIAN_CODENAME=bookworm

FROM python:${PYTHON_VERSION}-slim-${DEBIAN_CODENAME}

ENV LC_ALL=C.UTF-8
ENV PS1="(deb) \w \$ "

RUN apt-get update && \
    apt-get -y -q install bash ruby ruby-dev rubygems build-essential curl git zip bzip2 jq wget sudo
# https://github.com/jordansissel/fpm/issues/1663
RUN gem install --no-document backports -v 3.15.0
RUN gem install --no-document fpm

ARG GO_INSTALL_VERSION=1.23.2
ARG TARGETARCH

# Install go
RUN echo downloading go${GO_INSTALL_VERSION} && \
    curl -sSL --retry 3 -o golang.tar.gz https://golang.org/dl/go${GO_INSTALL_VERSION}.linux-${TARGETARCH}.tar.gz && \
    tar xzf golang.tar.gz && \
    mv go /usr/lib/ && rm golang.tar.gz && \
    ln -s /usr/lib/go/bin/go /usr/bin/go

ENV INSTALL_PATH=/packages/bin
ENV PATH=${INSTALL_PATH}:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN mkdir -p ${INSTALL_PATH}

COPY . /packages
RUN mkdir -p /packages/tmp
RUN make -C /packages/install/ all

WORKDIR /packages
ENTRYPOINT []
CMD ["/bin/bash"]
