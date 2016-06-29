---
title: Reduce Microservices overhead using Kong and Rancher
date: '2016-06-16'
draft: false
tags:
  - microservices
  - docker
  - rancher
author: yunspace
---

One of the major draw backs of Microservice is the amount of potential overhead: having to repeatedly implement the same cross cutting `perimeter functionalities`, across many services written in different languages. Some obvious examples are:

- authentication
- cross origin
- rate limiting
- caching

Instead of tackling the perimeter functionalities at a code level, a potentially easier solution could be to adopt a [API Gateway][api-gateway-pattern] pattern. And for the last few months I had used Mashape's [Kong][kong-url] API Management layer quite extensively. It sits at the Load Balancer level, performing common functionalities, before passing the request to downstream Services and API Gateways. 

![Kong Perimeter Functions](/images/kong/perimeter-functions.png)

Deploying Dockerised Kong into Rancher is easy. I've made a [Rancher fork][kong-docker-service] to the official Kong docker image, that uses the Rancher metadata service for IP discovery with more flexible Environment Variables. To further simplify things, I've created a [Kong Rancher Catalog][kong-catalog]. 

![Harp Web Server](/images/kong/kong-catalog.png)

This has been tested quite thoroughly for PostgreSQL and is currently being used in Production by the [DriveYello][yello] team. Consider Kong if you:

- prefer an opensource alternative to vendor solutions such as AWS API Gateway [released just last week in Sydney region][aws-api-gateway-syd]
- have a security design that is comfortable to push functions such as authentication to the perimeter
- have limited time/resources and wish to focus on your Service domain rather than the plumbing.

Try it out and welcome any feedback. I'm planning to give a talk on this topic at the [Rancher Sydney][rancher-syd] meetup. Stay tuned.

[aws-api-gateway-syd]:	https://aws.amazon.com/about-aws/whats-new/2016/06/amazon-api-gateway-available-in-asia-pacific-sydney/
[api-gateway-pattern]:	http://samnewman.io/patterns/architectural/bff/
[kong-url]:				https://getkong.org/
[kong-docker-service]:	https://github.com/LittleBayDigital/docker-kong-service
[kong-catalog]:			https://github.com/LittleBayDigital/littlebay-rancher-catalog
[yello]:				http://www.driveyello.com/
[rancher-syd]:			http://www.meetup.com/Rancher-Sydney/
