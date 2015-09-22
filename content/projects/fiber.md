+++
date = "2015-01-01T14:47:09-05:00"
draft = false
title = "Austin Google Fiber"
description = "A small webapp to scrape Google Fiber listings for Austin, TX"
categories = ["HTML", "Go", "AngularJS", "Bootstrap", "Heroku"]
+++

## The Fiber dream

When my wife told me she got a job at IBM in Austin, TX my first thought was: **CONGRATUALTIONS!** My second thought was: **My friends are going to be super jealous when I tell them I'm getting Google Fiber.**

## The Fiber reality

After scouring apartment listings in Austin and doing a bit of research it became clear that Google Fiber rollout was only starting in specific zip-codes, and it was moving rather slowly. Google provided an excellent [map of Fiber listings](https://fiber.google.com/cities/austin/apartments/) in Austin but there was no way to actually tell how often the listings were updated, if at all... So, I decided to write a webapp to track new Fiber listings, as they were added.

## Reverse engineering Google Fiber listings

I used Chrome developer tools to uncover how the Fiber map worked and discovered that the data for all Fiber enabled apartments was being stored in a JSON file that the site uses to build an apartment map on load. I wrote a Go tool to fetch, parse, and store apartment data in a separate database on [Heroku](https://www.heroku.com/). The tool would run about once an hour to check for new listings.

I then created a front end for the new apartments in AngularJS. The site loads apartment data from the Heroku database and also lists important apartment information such as the name, address, and time the listing was added. The site works perfectly, and now we're now up to date with new Fiber listings in our area.

The current Austin Fiber site is still up [here](https://austin-fiber.herokuapp.com/#/). Check out the code on [Github](https://github.com/Jwsonic/fiber).
