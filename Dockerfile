# Install CFSSL from official cfssl.org binaries
FROM cfssl/cfssl:1.3.2 as cfssl

# Install remaining packages
FROM alpine:3.9
ENV INSTALL_PATH=/packages/bin
ENV PATH=${INSTALL_PATH}:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN mkdir -p ${INSTALL_PATH}
RUN apk add --update --no-cache bash make curl coreutils libc6-compat tar xz

COPY --from=cfssl /go/bin/ ${INSTALL_PATH}/

COPY . /packages
RUN mkdir -p /packages/tmp
RUN make -C /packages/install/ all
WORKDIR /packages
