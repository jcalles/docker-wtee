FROM alpine
MAINTAINER  Javier Calles "jcalles@teravisiontech.com"
RUN apk update \
&& apk add --no-cache python wget coreutils\
#&& apk add --no-cache wget \
&& wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate \
#&& apk add --no-cache coreutils \
&& python get-pip.py \
&& pip install wtee

ARG LOGPATH
ENV LOGPATH=$LOGPATH

RUN echo $'#!/bin/sh\n\
tail -f $(find $LOGPATH -type f -iname "*.log")|wtee -d -b 0.0.0.0:8080 |nl > /dev/null 2>&1\n '\
>> /docker-entrypoint.sh && chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
