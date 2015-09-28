---
title: Dropwizard Gradle Build with ShadowJar
date: '2014-02-12'
tags:
- dropwizard
- gradle
author: yunspace
aliases:
  - /blog/dropwizard-gradle-shadowjar
---
I've moved from [FatJar][fatjar] to [ShadowJar][shadow] plugin for building my Dropwizard Gradle fat jar. It's a direct port of the Maven [Shade][shade] plugin, under active support by the folks at [Object Partners][objectpartners] and offers better performance.

Setting up Shade is quite straight forward, simply put in the following configurations:

    buildscript {
        repositories {
            jcenter()
        }
        dependencies {
            classpath 'com.github.jengelman.gradle.plugins:shadow:1.1.2'
        }
    }
    apply plugin: 'com.github.johnrengelman.shadow'

and configure your shadow plugin with the 'shadow' and 'jar' keyword:

    shadow {
        exclude 'META-INF/*.DSA'
        exclude 'META-INF/*.RSA'
    }
    jar {
        manifest {
            attributes 'Main-Class': mainClassName
        }
    }

Everything builts correctly but I get the following error when I try to run my Dropwizard application:

    yun$ java -jar build/distributions/dropwizard-example-xml-0.5.0-SNAPSHOT.jar server helloxml.yml
    helloxml.yml has an error:
      * Failed to parse configuration at: server.connector; Could not resolve type id 'http' into a subtype of [simple type, class io.dropwizard.jetty.ConnectorFactory]

The answer can be found on [Dropwizard Google Groups][dw-group]. Simply need to add the following Shadow plugin into my shadow configuraiton:

    shadow {
        mergeServiceFiles()
        exclude 'META-INF/*.DSA'
        exclude 'META-INF/*.RSA'
    }

A example of how all these fit together in gradle can be found in my [Dropwizard XML Example][dropwizard-xml-example] project. Or you can refer to the following gist:

<script src="https://gist.github.com/yunspace/170efc94faa7fe974207.js"></script>

[objectpartners]: http://www.objectpartners.com/2013/07/16/creating-self-contained-executable-jars-with-gradle-and-shadow/
[contact_dw]:     https://github.com/kyleboon/contact_dropwizard/blob/master/build.gradle
[fatjar]:         https://github.com/musketyr/gradle-fatjar-plugin
[shadow]:         https://github.com/johnrengelman/shadow
[shade]:          http://maven.apache.org/plugins/maven-shade-plugin/
[dropwizard-xml-example]: https://github.com/yunspace/dropwizard-xml-example/
[dw-group]:       https://groups.google.com/forum/#!topic/dropwizard-user/3sPfYH9wzlY
