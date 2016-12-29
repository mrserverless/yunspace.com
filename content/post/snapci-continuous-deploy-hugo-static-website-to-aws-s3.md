---
author: yunspace
comments: true
date: '2016-12-28T21:27:00+11:00'
share: true
tags:
  - hugo
  - static
  - aws
  - snapci
title: "SnapCI Continuously Deploy Hugo static website to AWS S3"
---

![SnapCI Hugo S3](/images/serverless/snapci-hugo-s3.png)

I've moved my blog away from Docker to a more hands off approaching using S3 + Cloudfront. As a matter of fact, I'm moving away from Docker and Infrastructure in general 
for all things and do things in a serverless manner where possible. Will talk about that more in another post.

I chose to use S3 instead of GitHub pages due to more control and having everything in one place. I chose not to use Lambdas to trigger page regeneration because SnapCI
 can do the same thing and is alot simpler, with sudo access, Docker support and AWS CLI all out of the box. 

My build pipeline is [publicly available here][snapci_pipeline]

[snapci_pipeline]:  https://app.snap-ci.com/yunspace/yunspace.com/branch/master