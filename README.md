# YunSpace.com

My blog using [HarpJS](http://harpjs.com) deployed as [Docker](http://docker.io) containers managed
by [Tutum](https://tutum.co)

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

## Tech Stack

* Blog Template: [hb-simurai](https://github.com/kennethormandy/hb-simurai)
* Base Image: [yunspace/alphine-harp](https://quay.io/repository/yunspace/alphine-harp)
* Docker Repo: [Quay.io](quay.io)

## Usage

Run using HarpJS:

  npm install -g harp
  harp server .

Build and run Docker

  docker build -t yunspace/yunspace.com .
  docker run --rm -t -p 8080:8080 yunspace/yunspace.com
