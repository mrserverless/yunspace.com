---
title: Dropwizard Microservice Spike Pt 1 - Justifications
date: '2014-10-22'
tags:
- dropwizard
- microservices
author: yunspace
aliases:
	- /blog/dropwizard-microservice-spike-pt1
---
Recently at [Apmasphere][apmasphere] we have been attempting a series of architectural [spikes][spikes]. One of which was to move from a single monolithic cloud based application towards a more distributed Microservices architecture using RESTful APIs. The spike ran in parrallel: I'm in charge of the JVM stream while my collegaue heads the Ruby on Rails prototype.

## Container-less framework
During the framework selection process I decided to rule out all war-based frameworks. No application servers, not even Tomcat. This decision was not welcomed by all, but thinking from a architectural perspective, the the future of the Java application space is definitely moving towards a lightweight, self-executing and container-less model. Most modern languages are already there, Rails and Node.js are good examples.

Earlier this year Eberhard Wolff wrote a slideshow titled [Java Application Servers are Dead][appserver_dead] which raised some eye brows, but the idea wasn't new. Back in 2011, Heroku announced [Container-less Java Support][heroku_java], quoting Mike Gualtieri from Forrester Group on: [Stop Wasting Money On WebLogic, WebSphere, And JBoss Application Servers][appserver_waste_money]. Mike debunked many popular Application Server myths and says to use Apache Tomcat because it's free. However he then goes on to say that even Tomcat may not be necessary because [The Application Server Bubble Is About To Burst][appserver_bubble_bust]:

	I question even the need for a container. Seriously, why can’t Java web applications just run on the operating system like the containerless Microsoft .NET applications?
	...
	Traditional application servers or containers such as Tomcat will fast become legacy methods for deploying Java applications. The next generation is elastic application platforms (EAP) that are containerless.

Eventually Heroku did support Tomcat in 2012 as part of [Heroku Enterprise for Java][heroku_tomcat]. But unless we have "Enterprise" needs or stuck with legacy infrastructure, we should really be aiming for a leaner approach.

Our container-less JVM based framework shortlist came down to:

* Dropwizard (Jersey, Jackson, Guava, Metrics, Jetty)
* RatPack (Java8, Guava, Reactive Streams, Netty)
* Play!
* Grails with standalone plugin
* Spring Boot

Based on the title of this blog you can probably guess which was the winner.

## Why Dropwizard
Being container-less is good for lazy programmers who don't want to maintain servers, but that not only reason. As Martin Fowler describes the framework [make it easy to do the right thing][right_thing], which is re-iterated in the [ThoughtWorks Technology Radar] under Languages and Frameworks:

	Dropwizard is an opinionated combination of several lightweight Java tools and frameworks, many of which would merit mention in their own right. The package embodies many of our favorite techniques, including an embedded HTTP server, support for RESTful endpoints, built-in operational metrics and health-checks, and straightforward deployments. Dropwizard makes it easy to do the right thing, allowing you to concentrate on the essential complexity of a problem rather than the plumbing.

There is also the performance factor. The lightweight combination of Jersey + Jackson is extremely fast. According to [TechEmpower Benchmarks][benchmark], Dropwizard has been a top performer in multiple JSON database queries.

## Plan
In the coming days, I will be assessing Dropwizard according to the following criterion:

* Rendering a static AngularJS frontend bundle
* Database ORM and persistence
* Vendor integration
* Background scheduling, queuing and asynchronous processing
* WebSockets integration

Not in scope for this spike but I will try to explore anyway:

* Plug into a distributed Service Discovery framework such as [Apache ZooKeeper][zookeeper]
* Feeding Dropwizard's Ops-friendly metrics into a monitoring platforms such as [librato][librato].
* Implementing "Smart Endpoints, Dumb Pipeline" design through a thin integration layer such as [ZeroMQ][zeromq]

Ultimately I'm really interested in how our little Dropwizard microservice will compare to our Rails solution. Stay tuned.

[apmasphere]: 		http://team.apmasphere.com/
[spikes]:			http://agiledictionary.com/209/spike/
[gcloud]:			https://cloud.google.com/
[gapi]:				https://developers.google.com/apis-explorer/
[appserver_dead]: 	http://www.slideshare.net/ewolff/java-application-servers-are-dead
[heroku_java]:		https://blog.heroku.com/archives/2011/8/25/java
[heroku_tomcat]:	https://blog.heroku.com/archives/2012/9/19/announcing_heroku_enterprise_for_java
[appserver_waste_money]: http://blogs.forrester.com/mike_gualtieri/11-07-15-stop_wasting_money_on_weblogic_websphere_and_jboss_application_servers
[appserver_bubble_bust]: http://blogs.forrester.com/mike_gualtieri/11-04-27-the_application_server_bubble_is_about_to_burst
[right_thing]:		http://martinfowler.com/articles/microservices.html#MakeItEasyToDoTheRightThing
[tech_radar]:		http://www.thoughtworks.com/radar/languages-and-frameworks
[benchmark]:		http://www.techempower.com/benchmarks/#section=data-r9&hw=peak&test=query
[zookeeper]:		http://zookeeper.apache.org/
[librato]:			https://metrics.librato.com/
[zeromq]:			http://zeromq.org//
