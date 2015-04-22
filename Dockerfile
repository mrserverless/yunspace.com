FROM quay.io/yunspace/alphine-harp:0.17.0-squashed
MAINTAINER Yun Zhi Lin <yun@yunspace.com>

WORKDIR /yunspace

COPY harp.json harp.json
COPY public/ public/

EXPOSE 8080
ENTRYPOINT ["harp"]
CMD [ "server", "-p", "8080", "." ]
