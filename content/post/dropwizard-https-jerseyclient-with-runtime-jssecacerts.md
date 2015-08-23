---
title: Dropwizard HTTPS JerseyClient with runtime JSSE CA Certificates
date: '2015-05-16'
tags:
- dropwizard
- ssl
- jersey
author: yunspace
linktitle: Dropwizard HTTPS JerseyClient with runtime JSSE CA Certificates
---

For Jersey Client (or any Java web client for that matter) to connect to a SSL endpoint, the target server certificate must be
installed as `jssecacerts` files into your JRE truststore at `$JAVA_HOME\jre\lib\security`. This is painful if you don't have access
to infrastructure, or don't want to patch/update your server/base Docker container everytime your SSL certificate changes. I will
show you a more elegant solution for JerseyClient/Dropwizard JerseyClient, where the certificate is loaded from file during runtime
and doesn't need to live in the JRE.

1. Extract server certificate in JSSE format - Mkyong has a very good tutorial on [extracting server certificate into jssecacerts][mkyong] using [InstallCert][InstallCert].
2. Once you have the `jssecacerts` file, put it inside your application's `src/main/resources` folder.
3. For a vanillar Jersey Client, you can enable HTTPS following this [answer][answer] and referenced links.
4. Dropwizard JerseyClient is built using its own `JerseyClientBuilder`, which you need to confirm to. The answer can be found [JerseyClientBuilderTest][test].
Simply replace the default `SSLSocketConnectionFactory` with one initialised using your `jssecacerts` TrustStore. A gist is worth a thounsand words:
<script src="https://gist.github.com/yunspace/7687f67a8eeade0c92d5.js"></script>

[mkyong]: http://www.mkyong.com/webservices/jax-ws/suncertpathbuilderexception-unable-to-find-valid-certification-path-to-requested-target/
[InstallCert]: https://github.com/escline/InstallCert
[answer]: http://stackoverflow.com/questions/2145431/https-using-jersey-client
[test]: https://github.com/dropwizard/dropwizard/blob/7ce0d065133cf68191389cf129dffa157c239cb0/dropwizard-client/src/test/java/io/dropwizard/client/JerseyClientBuilderTest.java#L280
