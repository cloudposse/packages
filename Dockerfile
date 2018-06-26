#
# Build certain packages from source (bleeding edge)
#

# Build Helmfile
FROM golang:1.10 as helmfile
ARG HELMFILE_VERSION=af1914c57530eb0a33ea4710bf7e0659a6eb2469
WORKDIR /go/src/github.com/roboll/helmfile 
RUN git clone -b ${HELMFILE_VERSION} https://github.com/roboll/helmfile.git .
RUN make static-linux

#
# Install remaining packages
#
FROM alpine:3.7
ENV INSTALL_PATH=/packages/bin
ENV PATH=${INSTALL_PATH}:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN mkdir -p ${INSTALL_PATH}
RUN apk add --update --no-cache make curl coreutils libc6-compat
COPY --from=helmfile /go/src/github.com/roboll/helmfile/dist/helmfile_linux_amd64 ${INSTALL_PATH}/helmfile
RUN ls -l ${INSTALL_PATH}/
ADD . /packages
RUN make -C /packages/install/ all
WORKDIR /opt
