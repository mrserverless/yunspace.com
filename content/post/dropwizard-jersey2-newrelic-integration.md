---
title: Dropwizard Jersey2 NewRelic Integration
date: '2015-01-29'
tags:
- dropwizard
- jersey
- devops
author: yunspace
linktitle: Dropwizard Jersey2 NewRelic Integration
---
In order to integrate Dropwizard 0.8.x with the in depth analytics provided by [New Relic](http://newrelic.com/), I've made some enhancements to the code samples from Kyle Boon's blog: [Enabling Newrelic for Dropwizard](http://kyleboon.org/blog/2013/09/23/newrelic-for-dropwizard/).

With Dropwizard's upgrade to Jersey2, it's a matter of migrating logic from `ResourceMethodDispatchProvider` to `ApplicationEventListener` and `RequestDispatcher` to `RequestEventListener`. Gist available here:

<script src="https://gist.github.com/yunspace/8d65f88a1cb8fa2db46e.js"></script>
