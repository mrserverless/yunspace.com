---
author: yunspace
comments: true
date: '2015-10-04T18:53:11+11:00'
draft: false
share: true
tags:
  - hugo
  - static
  - docker
  - tutum
title: "Harp to Hugo"
---

I've moved my blog away from [Harp](http://harpjs.com/) to [Hugo](https://gohugo.io/). And wrote a couple of useful tools along the way:

 - [Harp2Hugo](https://rubygems.org/gems/harp2hugo) gem to do the content conversion for meta data.
 - [Alpine Docker Hugo](https://github.com/TechnoTycoon/docker-alpine-hugo) - available on both
 [docker hub](https://hub.docker.com/r/technotycoon/alpine-hugo/) and [quay.io](https://quay.io/repository/technotycoon/alpine-hugo)

My blog's [Tutum Stack](https://github.com/yunspace/yunspace.com/blob/master/docker-compose.yml)
and [Dockerfile](https://github.com/yunspace/yunspace.com/blob/master/Dockerfile) have been updated accordingly.
Check it out if you need usage examples.

I chose Hugo mainly because:

 1. has proper theme support - switch/modify themes on the fly, without hacking around your content pages.
 2. processing speed - 1 millisecond per page
 3. powerful web server - on par with Apache if not closer to NGinx
 4. better documentation and responsive support forums.
