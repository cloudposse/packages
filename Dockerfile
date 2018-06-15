FROM alpine:3.7
ENV INSTALL_PATH=/packages/bin
ENV PATH=${INSTALL_PATH}:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN mkdir -p ${INSTALL_PATH}
RUN apk add --update --no-cache make curl coreutils libc6-compat
ADD . /packages
RUN make -C /packages/install/ all
WORKDIR /opt
