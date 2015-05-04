In late 2014 whilst working on our AngularJS frontend app, I discovered and recommended [HarpJs](http://harpjs.com/) to the team. If you don't know what HarpJs is, have a read of Sintaxi's [Introducing Harp](http://sintaxi.com/introducing-harp):

For my personal blog, I have also decided to migrate over to harp. My blogs now consists of just my articles and HTML/CSS templates, Harp takes care of the rest. No more need to build static files like Jekyll.

The next question is where to host my harp blog. There are several options:

- Use static `harp compile` to [deploy to GitHub Pages](http://harpjs.com/docs/deployment/github-pages). But that kinda beats the point of drop in preprocessing.
- I tried [Harp.io](https://www.harp.io/) for a while, it's very easy to use but and I highly recommend it. However as a Software Engineer almost felt a bit dumbed down (use Dropwbox for publish?).

In the end created I hosted my blog via Docker [AlphineLinux Harp](https://github.com/yunspace/docker-alphine-harp) containers, load balanced across my own [Docker Swarm](http://docs.docker.com/swarm/) cluster running on [Windows Azure](http://azure.microsoft.com/), and managed by [Rancher.io](http://rancher.io). It's a bit of a overkill but it was quite a fund building process. I'll blog about
