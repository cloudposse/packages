# Install CFSSL from official cfssl.org binaries
ARG CFSSL_VERSION=1.3.2
FROM cfssl/cfssl:${CFSSL_VERSION} as cfssl

# Install remaining packages
FROM alpine:3.8
ENV INSTALL_PATH=/packages/bin
ENV PATH=${INSTALL_PATH}:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN mkdir -p ${INSTALL_PATH}
RUN apk add --update --no-cache bash make curl coreutils libc6-compat tar xz alpine-sdk

COPY --from=cfssl /go/bin/ ${INSTALL_PATH}/

ADD . /packages
RUN make -C /packages/install/ all
WORKDIR /packages
