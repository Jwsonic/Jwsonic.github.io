+++
date = "2015-01-01T14:47:09-05:00"
draft = false
title = "Austin Google Fiber"
description = "A small webapp to scrape Google Fiber listings for Austin, TX"
categories = ["HTML", "Go", "AngularJS", "Bootstrap", "Heroku"]
+++

## The Fiber dream

When my wife, Jesyka, told me she got a job at IBM in Austin, TX my first thought was: **CONGRATUALTIONS!** My second thought was: **My friends are going to be super jealous when I tell them I'm getting Google Fiber.**

## The Fiber reality

After scouring apartment listings in Austin and doing a bit of research it became clear that there were a few problems with my Google Fiber dream:

* Roll-out is only scheduled for specific areas of Austin
* None of these areas is a reasonable commute distance from where Jesyka's would be working
* New areas were being added slowly

Google provides an excellent [map of Fiber listings](https://fiber.google.com/cities/austin/apartments/) in Austin but there was no way to actually tell how often the listings were updated, if at all. Not to be deterred, I decided to write a webapp to track new Fiber listings, as they were added.

## Reverse engineering Google Fiber listings

Using Chrome developer tools I was able to check network traffic on Google map and discovered that the data for all Fiber enabled apartments was being stored in a JSON file. This JSON file was used by Google to build the apartment map on page load.

Rather than use [inline linking](https://en.wikipedia.org/wiki/Inline_linking) for my webapp, I wrote a Go tool to fetch, parse, and store apartment data in a separate database on [Heroku](https://www.heroku.com/). This prevented page loads from my app causing additional traffic on Google servers. Heroku's background job scheduler runs the tool a few times a day, to avoid being the server stress mentioned earlier.

For the front end of the webapp I used AngularJS. The front end uses an ajax request to query the Heroku back end for JSON apartment data. The apartment data is then loaded into a table listing important information such as the name, address, and time the listing was added. Using AngulaJs' built in data filtering, users can search for listings by name or address.

## Check it out

The Austin Fiber site is still up [here](https://austin-fiber.herokuapp.com/#/). The code is also available on [Github](https://github.com/Jwsonic/fiber).
