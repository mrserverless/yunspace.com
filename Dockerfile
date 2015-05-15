FROM quay.io/yunspace/alphine-harp:0.17.0-squashed
MAINTAINER Yun Zhi Lin <yun@yunspace.com>

ENV NODE_ENV prouction
WORKDIR /yunspace.com

COPY harp.json harp.json
COPY public/ public/

EXPOSE 9000
ENTRYPOINT ["harp"]
CMD [ "server", "-p", "9000", "." ]
