---
title: Dropwizard Hibernate OneToMany
date: '2014-02-16'
tags:
  - dropwizard
  - database
  - hibernate
author: yunspace
aliases:
  - /blog/dropwizard-hibernate-onetomany
---
Inspired by the: [Black Sails][blacksails] tv series, I decided to make a pirate themed sample project for [Dropwizard XML Provider][dropwizard-xml]. The premise is simple: each Pirate has many Ships and each Ship has one Pirate. Thus a @OneToMany relationship, stored in H2 db.

However the Dropwizard example in the manual and on the web seem to be all single database objects. Being a Hibernate-noob myself, I ended up doing a lot of trial and erroring. The final working code base are available on [github][dropwizard-xml].

Below are some major errors I came across in my setup. The solutions are slightly different to StackOverflow answers since DropWizard is not a typical Hibernate war application.

###1. Exception in thread "main" org.hibernate.AnnotationException: Use of @OneToMany or @ManyToMany targeting an unmapped class

    Exception in thread "main" org.hibernate.AnnotationException: Use of @OneToMany or @ManyToMany targeting an unmapped class: com.yunspace.helloxml.core.Pirate.ships[com.yunspace.helloxml.core.Ship]

In hibernate, mapped classes are specified in config files. In dropwizard there are no hibernate config files, mapped classes are specified in the HibernateBundle:

    private final HibernateBundle<HelloXmlConfiguration> hibernateBundle =
        new HibernateBundle<HelloXmlConfiguration>(Pirate.class, Ship.class) {
        	@Override
        	public DataSourceFactory getDataSourceFactory(HelloXmlConfiguration configuration) {
        		return configuration.getDataSourceFactory();
        	}
        };

###2. org.hibernate.LazyInitializationException: failed to lazily initialize a collection of role

    org.hibernate.LazyInitializationException: failed to lazily initialize a collection of role: com.yunspace.helloxml.core.Pirate.ships, could not initialize proxy - no Session

This is resolved by setting fetch type is EAGER for the list of Children in the Parent POJO:

    @OneToMany(fetchType=EAGER, mappedBy = "shipCaptain")
    private List<Ship> ships;

and also make sure any named query that select from the Parent also correctly JOIN into the Children table:

    SELECT DISTINCT p FROM Pirate p LEFT JOIN FETCH p.ships s WHERE p.pirateId = s.shipCaptain

###3. OnToMany Relationship Serialization Infinite Loop

This is caused by the Parent getting the Children, and each Children containing the Parent. There are many posts on [StackOverflow][stack] regarding this issue and various people suggested different solutions:
* Use @JSONIgnore annotation on parent reference in Child POJO - this would work but you would have no way of accessing this field.
* Customise the parent reference getter() in Child POJO - this is the approach I took.

    @JacksonXmlProperty(localName = "ShipCaptain")
    public String getCaptain() {
        return shipCaptain.getNickName();
    }

###4. Exception in thread "main" org.hibernate.HibernateException: Access to DialectResolutionInfo cannot be null when 'hibernate.dialect' not set

This is likely to be caused by you having another instance of the application running. Check if you have another debug session or the database migration is still running.


[blacksails]:       http://en.wikipedia.org/wiki/Black_Sails_(TV_series)
[dropwizard-xml]:   https://github.com/yunspace/dropwizard-xml
[stack]:            http://stackoverflow.com/questions/16577907/hibernate-onetomany-relationship-causes-infinite-loop-or-empty-entries-in-json
