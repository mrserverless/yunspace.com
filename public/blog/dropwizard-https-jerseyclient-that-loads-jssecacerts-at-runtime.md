
For Jersey Client (or any Java web client for that matter) to connect to a SSL endpoint, the target server certificate must be
installed as `jssecacerts` files into your JRE truststore at `$JAVA_HOME\jre\lib\security`. This is painful if you don't have access
to infrastructure, or don't want to patch/update your server/base Docker container everytime your SSL certificate changes. I will
show you a more elegant solution for JerseyClient/Dropwizard JerseyClient.

Mkyong has a very good tutorial on [extracting the server certificate into jssecacerts][mkyong] using [InstallCert]. Once you
have the jssecacerts, you can load it into a Jersey Client to enable HTTPS following the [answer][answer] here.

However Dropwizard has it's own integrated `JerseyClientBuilder`, so you can't simply `new()` one up. To create a Dropwizard JerseyClient and
load your `jssecacerts` into the TrustStore, the answer is found not in the docs, but in [JerseyClientBuilderTest][test]. Basically replace
the default `SSLSocketConnectionFactory` with one initialised using a TrustStore that contains the certificate. A gist is worth a thounsand words:
<script src="https://gist.github.com/yunspace/7687f67a8eeade0c92d5.js"></script>

[mkyong]: http://www.mkyong.com/webservices/jax-ws/suncertpathbuilderexception-unable-to-find-valid-certification-path-to-requested-target/
[InstallCert]: https://github.com/escline/InstallCert
[answer]: http://stackoverflow.com/questions/2145431/https-using-jersey-client
[test]: https://github.com/dropwizard/dropwizard/blob/7ce0d065133cf68191389cf129dffa157c239cb0/dropwizard-client/src/test/java/io/dropwizard/client/JerseyClientBuilderTest.java#L280
