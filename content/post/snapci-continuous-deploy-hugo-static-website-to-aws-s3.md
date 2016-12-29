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

I've moved my blog away from hosted in Docker to a more hands off approaching using S3 + Cloudfront. As a matter of fact, I'm moving away from Docker and Infrastructure in general 
for all things and do things in a serverless manner where possible. Will talk about that more in another post.

I chose to stay with SnapCI to trigger page generation, instead of using something like Lambda which would be a bit more over-engineered. SnapCI makes good sense because
it's free, simple and comes with Docker and AWS CLI support all out of the box. 

My build pipeline is [publicly available here][snapci_pipeline] and it's very simple:

1. `make build` - Generates pages using Hugo docker container which outputs everyting into `public` directory:
```
docker run --rm -v $PWD:/src -v $PWD/public:/output jojomi/hugo:0.18
```

2. `make deploy` - Calls AWS CLI to sync `public` directory into S3 bucket:
```
aws s3 sync public s3://www.yunspace.com
```

With Cloudfront at the edge, it won't really make a difference whether my site is hosted in S3 or GithHub Pages. Which is probably what I'll try next.

[snapci_pipeline]:  https://app.snap-ci.com/yunspace/yunspace.com/branch/master