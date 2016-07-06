FROM yunspace/alpine-hugo:0.16
MAINTAINER Yun Zhi Lin <yun@yunspace.com>

ENV HUGO_BASE_URL http://docker
WORKDIR /yunspace.com

RUN apk --update --no-cache add git && \
	git clone https://github.com/vjeantet/hugo-theme-casper themes/casper && \
	apk del git

COPY config.toml config.toml
COPY archetypes/ archetypes/
COPY content/ content/
COPY data/ data/
COPY layouts/ layouts/
COPY static/ static/

EXPOSE 1313

CMD hugo server --bind=0.0.0.0 --baseUrl=${HUGO_BASE_URL} --appendPort=false
