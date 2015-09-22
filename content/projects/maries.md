+++
date = "2014-12-18"
draft = false
title = "Marie Antoinette's Gluten-Free Bake Shoppe"
description = "Website for Marie Antoinette's Gluten-Free Bake Shoppe"
categories = ["HTML", "Go", "AngularJS", "Bootstrap", "Heroku", "Stripe"]
+++

## From restaurant to manufacturer
I've worked with Marie Antoinette's Gluten-Free Bake Shoppe, as their Lead Developer, since the company was founded. In late 2014, the company decided to shift their business strategy. The owners closed their restaurant and chose to focus and grow their manufacturing and distribution business by selling directly to vendors instead.

## Requirements
After working with the business owners, a designer, and speaking to product vendors, the following list of requirements was created:

* Display information about the bakery (contact, hours, etc)
* Allow customers to browse and search the bakery menu
* Allow customers to place online orders, which could be shipped or picked up
* Have a separate menu and order placement system for vendors
* Admin ability to edit menu items, create vendor invoices, and approve new vendor accounts
* Quick development is preferable as the current site lacks functionality

## Roll your own or use a prebuilt solution?

First I considered using an off the shelf solution such as Shopify or Magneto. Creating a content management system and ordering system from the ground up is quite a bit of work. Unfortunately, none of the existing systems I could find were able to satisfy all of the requirements.

## Development hows and whys

The front end was built using AngularJS and Bootstrap 3. AngularJS's strength lies in its two-way data binding as well as the large selection of third party libraries. Functionality such as filtering a list of menu items based on a query or by type is fairly trivial to do in AngularJS. Coupling AngularJS with Bootstrap allowed me to rapidly set up, try out, and iterate the front end. Bootstrap is also created to be customizable out of the box, so changing how everything looked was no problem.

For the back end I chose to use the [Go](http://golang.org/) programming language. I had been using Go in my side projects for a while and I wanted to leverage Go's strengths of:

* A robust standard library
* Easy to deploy to a variety of platforms, I chose [Heroku](https://www.heroku.com/)
* Excellent performance
* Built in concurrency
* Official library support for [Stripe](https://stripe.com/)(our payment processor)

I chose to use the [Martini](http://martini.codegangsta.io/) web framework after hearing about in on the [Changelog Podcast](https://changelog.com/117/). Martini has several upgrades the from the built in Go web framework including improved routing and middleware support. I also chose to use [GORM](https://github.com/jinzhu/gorm) to connect to the database. Using an ORM library over manual SQL queries made sense here because development speed was more important than raw performance.

## Still going strong

The site is still up and running today with both vendors and regular customers making online orders! You can check it out [here](https://www.mariesglutenfree.com).
