FROM quay.io/technotycoon/alpine-hugo:latest
MAINTAINER Yun Zhi Lin <yun@yunspace.com>

ENV HUGO_BASE_URL http://docker:1313
ENV HUGO_THEME casper
WORKDIR /yunspace.com

COPY config.toml config.toml
COPY archetypes/ archetypes/
COPY content/ content/
COPY data/ data/
COPY layouts/ layouts/
COPY static/ static/
COPY themes/ themes/

EXPOSE 1313

CMD hugo server --bind=0.0.0.0 --baseUrl=${HUGO_BASE_URL}
