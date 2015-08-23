---
title: Tutum HAProxy VirtualHost plus SSL Setup
date: '2015-05-16'
tags:
- homeserver
- windows
- nas
author: yunspace
published: false
linktitle: Tutum HAProxy VirtualHost plus SSL Setup
---
[Tutum Cloud](http://tutum.co/) provides many handy Docker images that it easy for you to manage your Docker infrastructure.
[tutum-haproxy] by far is one of the most useful. In this article I will demonstrate
how to setup virtual hosts to router multiple subdomains in a cluster.

```
                                                     |---- container_a1
                              |----- service_a ----- |---- container_a2
                              |   (virtual host a)   |---- container_a3
internet --- tutum/haproxy--- |
          (SSL Certificate)   |                      |---- container_b1
                              |----- service_b ----- |---- container_b2
                                  (virtual host b)   |---- container_b3
```

Whilst the HAProxy container works very well out of box for a [simple load balancer scenario][haproxy-tute], there isn't much
 documentations available when it comes to setting up more advanced use cases such as multiple Virtual Hosts.
The [tutum-haproxy] github README offers a lot instructions in commandline Docker format, however I would assume
most Tutum users would be more used to the GUI or Stackfiles.

## Tutum GUI

1. HAProxy Service setup
The HAProxy service should be setup with the following environment variables:

* General
    * privileged = true
    * endpoints = 80, 443, 1936

* Environment variables
    * BACKEND_PORTS = ports of all downstream applications
    *

2. Application Service setup

* Environment variables
   * VIRTUAL_HOST = [scheme]//[host]
   *

## Tutum Stackfile

[haproxy-tute](https://support.tutum.co/support/solutions/articles/5000050235-load-balancing-a-web-service)
[tutum-haproxy](https://github.com/tutumcloud/haproxy)
