# Install CFSSL from official cfssl.org binaries
# https://hub.docker.com/r/cfssl/cfssl/tags
FROM cfssl/cfssl:v1.6.5 AS cfssl

# Install remaining packages
FROM alpine:3.20.3
ENV INSTALL_PATH=/packages/bin
ENV PATH=${INSTALL_PATH}:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN mkdir -p ${INSTALL_PATH}
RUN apk add --update --no-cache bash make curl coreutils libc6-compat tar xz jq sudo go

COPY --from=cfssl /go/bin/ ${INSTALL_PATH}/

COPY bin/ /usr/local/bin/

COPY . /packages
RUN mkdir -p /packages/tmp
RUN make -C /packages/install/ all
WORKDIR /packages
