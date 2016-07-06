---
title: Effectively reduce Microservices overhead using Kong and Rancher
date: '2016-06-16'
draft: false
tags:
  - microservices
  - docker
  - rancher
author: yunspace
---

![Kong API Management](/images/kong/kong-api-management.png)

Effective combinations of `API Management` and `API Gateway` patterns can reduce overhead and offer simplicity in a growing Microservices ecosystem. By using:

 1. API Management Layer to centralise cross cutting `General Perimeter Functions`. Such as: authentication, cross origin, throttling, caching.  
 2. API Gateway layer to coordinate and aggregate downstream service calls into meaningful responses for upstream clients.

<center><blockquote class="twitter-tweet" data-cards="hidden" data-lang="en"><p lang="en" dir="ltr">Effectively reduce <a href="https://twitter.com/hashtag/Microservices?src=hash">#Microservices</a> overhead using <a href="https://twitter.com/mashape">@mashape</a> Kong and <a href="https://twitter.com/Rancher_Labs">@Rancher_Labs</a>: <a href="https://t.co/cJxw5EzGuR">https://t.co/cJxw5EzGuR</a> <a href="https://t.co/pjjAa5fY1b">pic.twitter.com/pjjAa5fY1b</a></p>&mdash; Yun Zhi Lin (@yunzhilin) <a href="https://twitter.com/yunzhilin/status/750348936640995328">July 5, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script></center>

Sam Newman's [article on BFF][bff-pattern] (Backend For Frontend, not Best Friend Forever) covers both of the above concepts very thoroughly. In terms of implementation I've used Mashape's [Kong API Management][kong-url] quite extensively. I found it so useful that I ended up creating the following helpers:  

- [Docker Kong as a Service][kong-docker-service] a fork of the official Kong docker image, that uses Rancher metadata service for IP discovery with more flexible Environment Variables. 
- [Kong Rancher Catalog][kong-catalog] a Rancher Catalogue that simplifies the global deployment of the above container across all Rancher nodes.

![Kong Rancher Catalog](/images/kong/kong-catalog.png)

The above setup using Kong + Postgres RDS has been tested quite thoroughly in Production by a previous startup I consulted for. I would recommend Kong if you:

- Prefer an opensource alternative and control, over vendor solutions such as AWS API Gateway ([recently became available in Sydney][aws-api-gateway-syd])
- Plan to integrate with other Mashape awesomeness such as [Gelato Developer Portal][gelato] or [Galileo Analytics][galileo]
- Have a security design that is comfortable to push authentication and other common functions to the perimeter
- Are under time/resources restrictions and wish to focus on your Services, rather than perimeter plumbing

Try it out and welcome any feedback. I'm planning to give a talk on this topic at the [Rancher Sydney][rancher-syd] meetup. Stay tuned.


[aws-api-gateway-syd]:	https://aws.amazon.com/about-aws/whats-new/2016/06/amazon-api-gateway-available-in-asia-pacific-sydney/
[bff-pattern]:			http://samnewman.io/patterns/architectural/bff/
[kong-url]:				https://getkong.org/
[kong-docker-service]:	https://github.com/LittleBayDigital/docker-kong-service
[kong-catalog]:			https://github.com/LittleBayDigital/littlebay-rancher-catalog
[gelato-url]:			https://gelato.io/
[galileo-url]:			https://getgalileo.io/
[rancher-syd]:			http://www.meetup.com/Rancher-Sydney/

