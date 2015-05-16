I'm a strong believer in Docker Microcontainers that are not based on Ubuntu or Debian, ideally less than 100mb. I was quite inspired by errordeveloper's minimal [dockerfile-oracle-java](https://github.com/errordeveloper/dockerfile-oracle-java) container using [BusyBox](https://registry.hub.docker.com/_/busybox/). So I set out to build a minimal container for Harp web server.
![docker-alphine-harp](/img/projects/docker-alphine-harp.png)

Why Microcontainers?
1. There's nothing "Micro" about deploying a 15mb MicroService onto a bloated 1GB container.
2. When you setup Continuous Integration / Delivery, your pipeline is no longer very "Continuous" when it's stuck pulling down GBs worth of redudant images across networks.
3. Also if you are in Australia(like me), you'll find that most images are stored in US (see above screenshot for some insight from Quay.io) which adds to the latency.

Caching helps, however they will eventually expire or you need to pull new changes. So the best alternative is to keep your container small in the first place.

At the time of writing, the most popular Harp container on DockerHub seem to be [attensee/harp](https://registry.hub.docker.com/u/attensee/harp/) which is 583mb. At my workplace we built our own Node + Harp container which was 325+ mb. My challenge was to improve on these.

My first attempt was BusyBox of course. I used [docker-nodebox](https://github.com/hwestphal/docker-nodebox) as a base image. I have both `node` and `npm` but needed `git`. So my Dockerfile looks like:

```
FROM hwestphal/nodebox

RUN apk --update add git
RUN npm install -g harp@0.17.0
```

Adding `git` brings out the issue: [Git doesn't work with BusyBox NodeJs](https://github.com/nodesource/docker-node-legacy/issues/14)

After reading through the issue comments, I saw that other had turned to [Docker Alphine Linux](https://github.com/gliderlabs/docker-alpine) as a base image, which offers a more complete package manager. So I used [ficusio/docker-nodejs](https://github.com/ficusio/docker-nodejs) as a base image and the `git` was installed successfully.

```
FROM ficusio/nodejs-base:0.12
```

After some time installing, I came across problems with: [Node-Sass fail to install on Alphine Linux](https://github.com/sass/node-sass/issues/808). `Node-sass` is required by Harp web server to preprocess Sass stylesheets. It's binary download is incompatible with Alphine Linux which meant it had to be re-compiled from source. To recompile I needed to add the following dependencies:

```
RUN apk --update add git python make g++
```
`Harp` and `Node-Sass` installed fine, however the extra packages made my image much bigger at 291mb. I added the following cleanup line:

```
RUN apk del git python make g++ && rm -rf /var/cache/apk/*
```

But that doesn't help since adding extra layers in Docker will only result in more space being consumed rather than less. To reclaim the space freed up by deleting the files, I need to squash my image as described in Century Lab's [Optimizing Docker Images](http://www.centurylinklabs.com/optimizing-docker-images/).

```
$ docker run -d yunspace/alphine-harp
{containerId}
$ docker export {containerId} | docker import – yunspace/alphine-harp:squashed
```

This resulted in a squashed or flattend container size of 127mb. Quite certain is this the smallest possible container with Node and Harp web server. Check it out and let me know if you have ideas for improvement:

* github: [yunspace/docker-alphine-harp](https://github.com/yunspace/docker-alphine-harp)
* quay.io: [![Docker Repository on Quay.io](https://quay.io/repository/yunspace/alphine-harp/status "Docker Repository on Quay.io")](https://quay.io/repository/yunspace/alphine-harp)
* dockerhub: [yunspace/alphine-harp](https://registry.hub.docker.com/u/yunspace/alphine-harp/)
