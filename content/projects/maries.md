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

First I considered using an off the shelf solution. Creating a content management system and ordering system from the ground up is quite a bit of work. I did research into existing "shopping cart solutions" such as Shopify or Magneto. Unfortunately, none of the existing systems I could find were able to satisfy all of the requirements. To use an off the shelf solution I would need to extend the code base with a plugin in the language chosen solution was written in. Rather than go down a rabbit hole of foreign application architecture, undocumented features, and learning a new language, I decided to build the Marie's site from scratch.

## Front End Structure

The front end was built using AngularJS and Bootstrap 3. AngularJS's strength lies in its two-way data binding as well as its large selection of third party libraries. Functionality such as filtering a list of menu items based on a search is fairly trivial to do in AngularJS. Coupling AngularJS with Bootstrap allowed me to rapidly set up, try out, and iterate different layouts. Bootstrap is designed to be customizable out of the box, so changing how everything looked was no problem.

## Why Go?

For the back end I chose to use the [Go](http://golang.org/) programming language. I had been using Go in my side projects for a while and I wanted to leverage Go's strengths of:

* A robust standard library
* Easy to deploy to a variety of platforms, I chose [Heroku](https://www.heroku.com/)
* Excellent performance
* Built in concurrency
* Official library support for [Stripe](https://stripe.com/)(our payment processor)

I chose to use the [Martini](http://martini.codegangsta.io/) web framework after hearing about in on the [Changelog Podcast](https://changelog.com/117/). Martini has several upgrades the from the built in Go web framework that the Maries site would rely on. These include:

* Middleware support for simple HTTP request/response modifications
* Improved routing controls, making REST API endpoints easy to write
* Dependency injection make sure that you always have access to the correct obejcts

 I also chose to use [GORM](https://github.com/jinzhu/gorm) to connect to the database. GORM allows you to declare normal Go structs that map directly to database tables. When you make a database query with GORM, it's a series of methods that return an easy to use Go struct. Using an ORM library over manual SQL queries made sense for the Maries site as development speed was more important than raw performance.

## Still going strong

The site is still up and running today with both vendors and regular customers making online orders! You can check it out [here](https://www.mariesglutenfree.com).
