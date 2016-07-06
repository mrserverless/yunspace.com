# YunSpace.com

My blog using [HarpJS](http://harpjs.com) as [Docker](http://docker.io) containers, built by [Quay.io](https://quay.io) and managed by [Tutum Cloud](https://tutum.co)

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/?repo=https://github.com/yunspace/yunspace.com)
[![Docker Repository on Quay.io](https://quay.io/repository/yunspace/yunspace.com/status "Docker Repository on Quay.io")](https://quay.io/repository/yunspace/yunspace.com)


## Tech Stack

* Blog Template: [Casper theme for Hugo](http://themes.gohugo.io/casper/)
* Base Image: [technotycoon/alphine-hugo](quay.io/technotycoon/alpine-hugo:latest)
* Container Image: [yunspace/yunspace.com](https://quay.io/repository/yunspace/yunspace.com)

## Usage

Run using Hugo:

    git clone https://github.com/vjeantet/hugo-theme-casper themes/casper
    hugo server .

Build and run Docker

    docker build -t yunspace/yunspace.com .
    docker run --rm -t -p 1313:1313 -e "HUGO_BASE_URL=localhost:1313" yunspace/yunspace.com
