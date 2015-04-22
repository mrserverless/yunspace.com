[Dropwizard][dropwizard.io] is smple yet awesome. By default it only takes JSON which is not so awesome for most Enterprise software and legacy systems. So I've written a [Dropwizard XML Bundle][dropwizard-xml] to make it easier to users who need XML serialisation, deserialisation and validation.
<img src="/img/dropwizard-xml.png" width="100" align=right>

The project is built based on the design of the Dropwizard JacksonMessageBodyProvider, and leverages the following proven opensource libraries:

1. [Jackson XML Provider][jackson-xml-provider]
2. [Jackson XMLMapper][jackson-dataformat-xml]
3. [Woodstox][woodstox]
4. [Gradle][gradle]

I plan to use this at work to implement XML based RESFful web services that runs container-less without proprietary application servers. See [github project][dropwizard-xml] for more details, feel free to report any issues or send me feedback.

[dropwizard.io]:            http://dropwizard.io
[dropwizard-xml]:           https://github.com/dropwizard/dropwizard
[jackson-xml-provider]:     https://github.com/FasterXML/jackson-jaxrs-xml-provider
[jackson-dataformat-xml]:   https://github.com/FasterXML/jackson-dataformat-xml
[woodstox]:                 http://wiki.fasterxml.com/WoodstoxHome
[gradle]:                   http://gradle.org
