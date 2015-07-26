Docker orchestration platform [Tutum Cloud](http://tutum.co/) provides many handy utility images
came across some challenges when setting up Virtual Hosts and SSL with Tutum [HAProxy](https://github.com/tutumcloud/haproxy)
fork. We managed to get everything to work in the end, and I will attempt to document some of our key learnings.

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
