After spending several days experimenting with both Dropwizard and Rails, our Engineering team put the two frameworks to a democratic vote. Dropwizard emerged as the winner, mainly due the Java heavy skill set we currently possess.

However Rails does also offer alot of advantages and interesting solutions to traditional problems. I personally really like Active Records and in an ideal Microservices world, both Dropwizard and Rails should be used side by side. They in fact share many design parallels, and Yammer sums up the two frameworks very well in "[Dropping Rails for Dropwizard?][drop_rails]". The answer is "No", use the right tool for the right job.

As a result of the spike, we found several useful shortcuts which I've compiled into gists for future reference:

 * [Serving Static Assets on "/" and API on "/api"][dw_static] - fix documented in the following [thread][dw_static_thread] but quite easy to get it wrong.
 * [Dropwizard JDBI Unit Test][jdbi_unit] and [Dropwizard JDBI Integration Test][jdbi_integration]
 * [Using Governator with Dropwizard Guice][dw_governator] - result of a [pull request][pull_request_39] I submitted to [Dropwizard-Guice][dropwizard-guice] which resolves the painful [injection issue with Environment dependent Singletons][issue_19]

I'm also quite glad with the team in reaching a consensus on using [gradle][gradle], which is something I've been also pushing for, ever since my original [code interview][code_interview]. With the help of a few diplomatic team members, most of my ideas for the backend API architecture have been realised. It's now a good time to shift focus towards our new exciting frontend stack consisting of AngularJS and Node.

[apmasphere]: 		http://team.apmasphere.com/
[gradle]:			http://www.gradle.org/
[drop_rails]:		https://speakerdeck.com/bmorton/dropping-rails-for-dropwizard-from-abril-pro-ruby-2014
[dw_static]:		https://gist.github.com/yunspace/280817bd58dff7d8e4b8
[dw_static_thread]:	https://groups.google.com/forum/#!topic/dropwizard-user/UaVcAYm0VlQ
[jdbi_integration]: https://gist.github.com/yunspace/b50b5b89bc1bad1fa556
[jdbi_unit]:		https://gist.github.com/yunspace/9a50e11dbd8661271220
[dw_governator]:	https://gist.github.com/yunspace/cbdb80ddca1403b55833
[dropwizard-guice]: https://github.com/HubSpot/dropwizard-guice/
[pull_request_39]:	https://github.com/HubSpot/dropwizard-guice/pull/39
[issue_19]:			https://github.com/HubSpot/dropwizard-guice/issues/19
[code_interview]:	https://slides.com/yunzhilin/dropwizard-mongodb/
