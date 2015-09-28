---
title: Harp Web Server
date: '2015-05-10'
tags:
- harp
- static
- blog
author: yunspace
aliases:
  - /blog/harp-web-server
---
![Harp Web Server](/images/harp/harp-dark-trans.png)
In late 2014 whilst working on AngularJS frontend apps on Herkou, I discovered and recommended [Harp web server](http://harpjs.com/) to the team. Harp is a powerful static file web server with built-in template proprocessing. It helped us eliminate much tedious build tasks and ruby gems from our static client projects. If you haven't heard of Harp, have a read of Sintaxi's [Introducing Harp](http://sintaxi.com/introducing-harp).

Half a year later, I have also decided to migrate over to harp for my personal blog. For smooth transitioning of my articles and meta data from Jekyll, I used the awesome [Jekyll2Harp](https://github.com/edrex/jekyll2harp). My blogs now consists of just my articles and HTML/CSS templates, and Harp preprocesses all my static files on the fly. No more Jekyll gems, no more compile commands. Also I no longer need to prefix my blog posts with the timestamp which is really neat. Lastly my Disqus comments was moved using [Disqus Migration Tools](https://help.disqus.com/customer/portal/articles/286778-migration-tools).

For a new blog template I picked Kenneth Ormandy's [HB-Simurai](https://github.com/kennethormandy/hb-simurai). It has an slight oriental feel and fits will with my [personal seal](/images/yun_stamp_trans.png).

The next question is where to host my harp blog. There are several options:

- Use static `harp compile` to [deploy to GitHub Pages](http://harpjs.com/docs/deployment/github-pages). But that kinda beats the point of drop in preprocessing.
- I tried [Harp.io](https://www.harp.io/) for a while, it's very easy to use but and I highly recommend it.

However as a Software Engineer I'm not a fan of using Dropbox as source control and wanted to be more hands on. In the end I settled on the following DIY solution:

- **Architecture** My blogs are effectively Harp Microservices within [Docker](https://www.docker.com) containers. I created my own minimal [AlphineLinux Harp](https://github.com/yunspace/docker-alphine-harp) containers.
- **Build**: GitHub commits triggers [Quay.io](https://quay.io/), which is Continuous Delivery for Docker. See my build status: [![Docker Repository on Quay.io](https://quay.io/repository/yunspace/yunspace.ninja/status "Docker Repository on Quay.io")](https://quay.io/repository/yunspace/yunspace.ninja)
- **Deploy** Successful Docker builds kicks off deployment webhook in [Tutum Cloud](http://tutum.co). Tutum takes care of Container orchestration and load balancing.
- **Virtual Machines** provided by [Windows Azure](http://azure.microsoft.com/).
- **DNS and CDN** using the free and powerful [Cloudfare](https://www.cloudFlare.com).

It's a bit of a overkill but it was quite a fun process and a good refresher on the similar setup I built at work a few months back. I will write a more detailed blog in the future in regards to the Tutum Cloud and Docker container setup.
