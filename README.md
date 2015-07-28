# YunSpace.com

My blog using [HarpJS](http://harpjs.com) as [Docker](http://docker.io) containers managed
by [Tutum](https://tutum.co)

[![Docker Repository on Quay.io](https://quay.io/repository/yunspace/yunspace.com/status "Docker Repository on Quay.io")](https://quay.io/repository/yunspace/yunspace.com) 

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/?repo=https://github.com/yunspace/yunspace.com)

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
