# YunSpace.Ninja

new blog using [HarpJS](http://harpjs.com) and [Docker](http://docker.io)

## Tech Stack

* Blog Template: [hb-simurai](https://github.com/kennethormandy/hb-simurai)
* Docker Image: [yunspace/alphine-harp](https://quay.io/repository/yunspace/alphine-harp)
* Docker Repo: [Quay.io](quay.io)
* Deployed to [Docker Swarm](https://docs.docker.com/swarm/) on [Windows Azure](http://azure.microsoft.com/)

## Usage

Run using HarpJS:

  npm install -g harp
  harp server .

Build and run Docker

  docker build -t yunspace/yunspace.ninja .
  docker run --rm -t -p 8080:8080 yunspace/yunspace.ninja
