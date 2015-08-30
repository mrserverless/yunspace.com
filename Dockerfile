FROM technotycoon/alpine-hugo:0.14
MAINTAINER Yun Zhi Lin <yun@yunspace.com>

ENV HUGO_BASE_URL http://localhost:1313
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
ENTRYPOINT [ "hugo" ]
CMD [ "server", "-t", "casper" ]
