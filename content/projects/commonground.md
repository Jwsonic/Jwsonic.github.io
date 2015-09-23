+++
date = "2014-07-25T14:47:09-05:00"
draft = false
title = "Common Ground"
description = "Teacher-centric lesson planning"
categories = ["HTML", "Go", "AngularJS", "Bootstrap", "Heroku", "Stripe"]
+++

## Teacher-centric lesson planning

Common Ground, a companion webapp to [Inscribe]({{< relref "projects/inscribe.md" >}}), enabled teachers with Inscribe accounts to create lesson plans for their current courses. Teachers could also export lesson plans and collaborate with other teachers on shared lesson plans. Common Ground had the following requirements:

* share login and user data with [Inscribe]({{< relref "projects/inscribe.md" >}})
* allow teachers to create lesson plans for Inscribe courses
* populate lesson plans on a calendar
* ability to easily export lesson plans to a variety of formats
* enable sharing of lesson plans and editing by multiple teachers

## Talking to Inscribe

Although the back end for Common Ground was written in a different language than Inscribe ([Go](http://golang.org/) and [Python](https://www.python.org/), respectively) it was pretty easy to communicate over HTTPS between the two. When a user would login to Common Ground, the following process took place:

* login request sent to Common Ground
* Common Ground forwarded the login request to Inscribe over HTTPS
* Inscribe checked the user's credentials and returned a [JSON Web Token](https://self-issued.info/docs/draft-ietf-oauth-json-web-token.html)(JWT)
* Common Ground sent the JWT back to the user to be stored client side

Common Ground and Inscribe shared the same JWT secret key, which is used to determine the validity of JWT claims. Sharing the JWT secret key between the two back ends made it so Common Ground could validate claims for Inscribe JWTs, instead of checking with the Inscribe back end every time the user tried to do something.

## Front end lessons from Inscribe

After the [lessons I learned from Inscribe]({{< relref "projects/inscribe.md#figuring-out-the-front-end" >}}), I immediately chose to use AngularJS for Common Ground's front end. Using the same front end framework across both Inscribe and Common Ground had the added benefit of allowing me to reuse code across the two projects. This enabled the team to quickly get Common Ground up and running.

## Iterate early, iterate often

Today Common Ground is no longer in use. After extensive user testing, Pomegranate Lab determined that a different approach was needed to help teachers better connect with their students. This project later iterated into [The Playbook](/projects/playbook/).

When it was around, Common Ground looked like this:

![Inscribe Img](/img/cg-combined.png)
