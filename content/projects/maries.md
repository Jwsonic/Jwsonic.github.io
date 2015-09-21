+++
date = "2014-12-18T14:47:09-05:00"
draft = false
title = "Marie Antoinette's Gluten-Free Bake Shoppe"
description = "Website for Marie Antoinette's Gluten-Free Bake Shoppe built with Go and AngularJS."
tags = ["Go", "AngularJS", "Bootstrap", "Heroku", "Stripe"]
+++


The Marie Antoinette's site had the following requirements:

* Display information about the bakery(contact, hours, etc)
* Allow customers to browse and search the in store menu
* Allow customers to place online orders
* Have a separate menu and order placement system for vendors
* Admin ability to edit menu items and approve new vendors
* Quick development is preferable as the current site lacks functionality

First I considered using an off the shelf solution such as Shopify or Magneto. Creating a content management system and ordering system from the ground up is quite a bit of work. Unfortunately, none of the existing systems I could find were able to satisfy all of the requirements.

The front end was built using AngularJS and Bootstrap 3. AngularJS strength lies in its two way data binding as well as the large selection of third party libraries. Functionality such as filtering a list of menu items based on a query or by type is fairly trivial to do with AngularJS. Coupling AngularJS with Bootstrap allowed me to rapidly set up, try out, and iterate the front end. Bootstrap is also created to be customizable out of the box, so changing how everything looked was no problem.

For the back end I chose to use the [Go](http://golang.org/) programming language. I had been using Go in my side projects for a while and I had come to appreciate its strengths:

* A robust standard library
* Easy to deploy to a variety of platforms, I chose [Heroku](https://www.heroku.com/)
* Excellent performance
* Built in concurrency
* Official library support for [Stripe](https://stripe.com/)(our payment processor)

I chose to use the [Martini](http://martini.codegangsta.io/) web framework after hearing about in on the [Changelog Podcast](https://changelog.com/117/). Martini has several upgrades the from the built in Go web framework including improved routing and middleware support. I also chose to use [GORM](https://github.com/jinzhu/gorm) to connect to the database. Using an ORM library over manual SQL queries made sense here since development speed was more important than raw performance.

The site is still up and running today! You can check it out [here](https://www.mariesglutenfree.com).
