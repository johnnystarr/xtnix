FROM alpine:3.10.3

#-------------------------------------------------------------------------------
#  Environment Variables
#-------------------------------------------------------------------------------

ENV NASM_VERSION="2.14.02"
ENV BOOTERIFY_VERSION="1.6"
ENV BOOTERIFY_PATH="/opt/booterify"

#-------------------------------------------------------------------------------
#  Constants
#-------------------------------------------------------------------------------

ENV BOOTERIFY_TGZ="booterify-${BOOTERIFY_VERSION}.tar.gz"
ENV BOOTERIFY_URL="https://www.raphnet.net/programmation/booterify"
ENV BOOTERIFY_URI="${BOOTERIFY_URL}/${BOOTERIFY_TGZ}"

#-------------------------------------------------------------------------------
#  Configuration
#-------------------------------------------------------------------------------

RUN set -x \
    && apk add --update --no-cache \
        "nasm=${NASM_VERSION}-r0" \
        wget \
        alpine-sdk \
    && mkdir -p ${BOOTERIFY_PATH} \
    && cd ${BOOTERIFY_PATH} \
    && wget ${BOOTERIFY_URI} \
    && tar xvf ${BOOTERIFY_TGZ} \
    && rm -f ${BOOTERIFY_TGZ} \
    && cd ${BOOTERIFY_PATH}/booterify-${BOOTERIFY_VERSION} \
    && make \
    && ./booterify -h

#-------------------------------------------------------------------------------
#  Entrypoint
#-------------------------------------------------------------------------------

CMD ["nasm", "--version"]