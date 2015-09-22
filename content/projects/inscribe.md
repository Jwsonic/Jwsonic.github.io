+++
date = "2013-10-10T14:47:09-05:00"
draft = false
title = "Inscribe"
description = "Assignments with a growth mindset"
categories = ["HTML", "Python", "AngularJS", "JQuery", "Bootstrap", "Heroku", "Stripe"]
+++

## Assignments with a growth mindset

Inscribe is the first webapp I worked on for [Pomegranate Lab](http://pomegranatelab.com/). It's purpose was to help teachers connect with their students by providing in-depth feedback about the student's assignments and what the student could do to improve their grades.

## Python to the rescue

Inscribe's back end was written in [Python](https://www.python.org/). Python is one of my favorite programming languages and is well suited for web development, so it was a perfect fit as there were no technical constraints for the language. I researched at several different Python web frameworks before settling on [Flask](http://flask.pocoo.org/). Flask is designed to be as unobtrusive as possible, meaning it gives you the tools you need to build webapps of varying sizes, but Flask never tries to force decisions on you.

## Handling user data

For the database, I used [PostgreSQL](http://www.postgresql.org/)(part of the Heroku default plan) and connected to it with the [SQLAlchemy](http://www.sqlalchemy.org/) ORM. SQLAlchemy made development much simpler by allowing me to treat database entries as Python objects.

Inscribe's back end handled a variety of data including user login sessions, assignment data, grades, and rubrics. Student accounts were free, but teachers were required to pay a monthly fee. User authentication was handled through [JSON Web Tokens](https://self-issued.info/docs/draft-ietf-oauth-json-web-token.html)(JWT) sent over a HTTP header and saved client side into a cookie. I chose to use JWT, over authentication methods, since it's a language agnostic specification that is robust and secure.

## Figuring out the front end

The front end of Inscribe went through several architecture iterations. Initially I built the front end for inscribe using [Jinja2 templates](http://jinja.pocoo.org/docs/dev/) and [JQuery](https://jquery.com/). This worked well initially, however, as the site grew and the features became more complex, it became increasingly cumbersome to implement new features in JQuery alone. After researching different front end frameworks, I chose AngularJS for the next iteration of Inscribe's front end.

AngularJS's two-way data binding makes it very easy to implement features that would have been fairly complicated to do with just JQuery. After only a couple of weeks rewriting Inscribe, the new AngularJS version was at feature parity with the old JQuery version. Additionally, rewriting the front end allowed me to simplify the back end into a series of REST API endpoints.

## Iterate early, iterate often

Today Inscribe is no longer in use. After extensive user testing, Pomegranate Lab determined that a different approach was needed to help teachers better connect with their students. This project later iterated into [The Playbook](/projects/playbook/).

When it was around, Inscribe looked like this:

![Inscribe Img](/img/inscribe-combined.png)
