+++
date = "2013-10-10T14:47:09-05:00"
draft = false
title = "Inscribe"
description = "Assignments with a growth mindset"
categories = ["HTML", "Python", "AngularJS", "JQuery", "Bootstrap", "Heroku", "Stripe"]
+++

## Assignments with a growth mindset

Inscribe is the first webapp I worked on for [Pomegranate Lab](http://pomegranatelab.com/). It's purpose was to help teachers connect with their students by providing in-depth feedback about the student's assignments and what the student could do to improve their grades. Inscribe had the following requirements:

* Teachers can create courses and manage which students are enrolled in their courses
* Teachers can create assignments from scratch or based on an existing rubric
* Students can complete assignments online
* Teachers can grade turned in student assignments and give detailed feedback on how they can improve

## Python to the rescue

As Inscribe was one of the first webapps I had ever worked on I wanted to make sure I chose a language I was already familiar with as to not slow down development. [Python](https://www.python.org/) is one of my favorite programming languages and is well equipped for web development, so it was a perfect fit.

Being new to web development, I researched at several different Python web frameworks before settling on [Flask](http://flask.pocoo.org/). Flask is designed to be as unobtrusive to your development process as possible. The Flask core library gives basic functionality for a webapp and extras like user authentication or database connections are implemented in easy to install plugins.

## Hosting with Heroku

I looked at several different possible hosting solutions for Inscribe and wound up settling on [Heroku](https://www.heroku.com/) for the following reasons:

* Set up was much easier than something like a VPS.
* Deployment was git based and I was already using git for version control.
* The development tier was free and would cover our initial needs. The ability to automatically scale was there if we needed more resources as well.
* Heroku offered easy to use add ons like databases, email services, logging, and more.

For the database, I used [PostgreSQL](http://www.postgresql.org/) with Heroku provided an excellent free tier for. Since development speed was more of a concern than raw database performance, I chose to use the [SQLAlchemy](http://www.sqlalchemy.org/) ORM. SQLAlchemy lets you treat database entries as python objects. This allows you to keep your mental focus on Python code, rather than bouncing back and forth between SQL queries and Python.

## Handling data on the back end

Inscribe's back end handled a variety of data operations including user login sessions, assignment data, grades, and rubrics.  User authentication was handled through [JSON Web Tokens](https://self-issued.info/docs/draft-ietf-oauth-json-web-token.html)(JWT) sent over a HTTP header and saved client side into a cookie. I chose to use JWT over other authentication methods, since it's a language agnostic specification that is robust and secure. When a user tried to update or create data the back end could check their JWT and make sure that:

* They're a valid user
* They have permission to create or edit the data

Student accounts for Inscribe were free, but teachers were required to pay a monthly fee. Rather than charge teacher credit cards directly, I chose to use [Stripe](https://stripe.com/) to handle all payment processing. Credit card numbers we sent directly to Stripe servers from the browser. Stripe then returns a token that could be used to make a charge to the teacher's card from the Inscribe back end. While this is a bit of extra coding up front, it removed all the extra security hassle that comes with handling credit card numbers directly.

## Figuring out the front end

The front end of Inscribe went through several different architecture iterations. Initially I built the front end for inscribe using [Jinja2 templates](http://jinja.pocoo.org/docs/dev/) and [JQuery](https://jquery.com/). When a browser requested a page, the backend would load the proper data for a page from the database and generate the html based on that page's template file. This method worked quite well initially. However, as the site grew and the features became more complex, organizing code and keeping pages organized became complicated. After researching different solutions and consulting with the rest of Pomegranate Lab, I chose AngularJS for the next iteration of Inscribe's front end.

The main feature that drew me to AngularJS's is its two-way data binding. Two-way data binding makes it very easy to implement features in AngularJS that would have been fairly complicated to do with just JQuery. After only a couple of weeks rewriting Inscribe, the new AngularJS version was at feature parity with the old JQuery version. Additionally, rewriting the front end allowed me to simplify the back end. No longer would the back end have to fetch data and render each page. Now the back end was for the most part a collection of REST API endpoints.

## Iterate early, iterate often

Today Inscribe is no longer in use. After extensive user testing, Pomegranate Lab determined that a different approach was needed to help teachers better connect with their students. This project later iterated into [The Playbook](/projects/playbook/).

When it was around, Inscribe looked like this:

![Inscribe Img](/img/inscribe-combined.png)
