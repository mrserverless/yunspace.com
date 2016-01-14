FROM quay.io/yunspace/alpine-hugo:latest
MAINTAINER Yun Zhi Lin <yun@yunspace.com>

ENV HUGO_BASE_URL http://docker
WORKDIR /yunspace.com

RUN apk update && apk add git && rm -rf /var/cache/apk/*
RUN git clone https://github.com/vjeantet/hugo-theme-casper themes/casper

COPY config.toml config.toml
COPY archetypes/ archetypes/
COPY content/ content/
COPY data/ data/
COPY layouts/ layouts/
COPY static/ static/

EXPOSE 1313

#ENTRYPOINT [ "hugo" ]
CMD hugo server --bind=0.0.0.0 --baseUrl=${HUGO_BASE_URL} --appendPort=false
