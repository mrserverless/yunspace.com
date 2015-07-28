[Tutum Cloud](http://tutum.co/) provides many handy Docker images that it easy for you to manage your Docker infrastructure.
[Tutum HAProxy](https://github.com/tutumcloud/haproxy) by far is one of the most useful. In this article I will demonstrate
how to setup virtual hosts to router multiple subdomains, and add SSL certificate/s to protect your network.

```
                                                     |---- container_a1
                              |----- service_a ----- |---- container_a2
                              |   (virtual host a)   |---- container_a3
internet --- tutum/haproxy--- |
          (SSL Certificate)   |                      |---- container_b1
                              |----- service_b ----- |---- container_b2
                                  (virtual host b)   |---- container_b3
```

Whilst the HAProxy container works very well out of box for a
[simple load balancer scenario](https://support.tutum.co/support/solutions/articles/5000050235-load-balancing-a-web-service),
there isn't much documentations available when it comes to setting up more advanced use cases such as multiple Virtual Hosts and
SSL Certificates.
