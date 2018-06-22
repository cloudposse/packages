#
# Build certain packages from source (bleeding edge)
#

# Build Helmfile
FROM golang:1.10 as helmfile
WORKDIR /go/src/github.com/roboll/helmfile 
RUN git clone -b master https://github.com/roboll/helmfile.git .
RUN make static-linux
RUN cp dist/helmfile_linux_amd64 /bin/helmfile

#
# Install remaining packages
#
FROM alpine:3.7
ENV INSTALL_PATH=/packages/bin
ENV PATH=${INSTALL_PATH}:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN mkdir -p ${INSTALL_PATH}
RUN apk add --update --no-cache make curl coreutils libc6-compat
COPY --from=helmfile /go/src/github.com/roboll/helmfile/dist/helmfile_linux_amd64 ${INSTALL_PATH}/bin/helmfile
ADD . /packages
RUN make -C /packages/install/ all
WORKDIR /opt
