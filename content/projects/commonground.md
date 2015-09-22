+++
date = "2014-07-25T14:47:09-05:00"
draft = false
title = "Common Ground"
description = "Teacher-centric lesson planning"
categories = ["HTML", "Go", "AngularJS", "Bootstrap", "Heroku", "Stripe"]
+++

## Teacher-centric lesson planning

Common Ground, a companion webapp to [Inscribe]({{< relref "projects/inscribe.md" >}}), enabled teachers with Inscribe accounts to create lesson plans for their current  courses. Teachers could also export their lesson plans and collaborate with other teachers on shared lesson plans. Common Ground had the following requirements:

* Share login and user data with [Inscribe]({{< relref "projects/inscribe.md" >}})
* Teachers can create lesson plans for Inscribe courses
* Lesson plans will show up on a calendar and are easily exportable to a variety of formats
* Lesson plans can be shared and edited by multiple teachers

## Talking to Inscribe

Although the back end for Common Ground was written in a different language than Inscribe([Go](http://golang.org/) and [Python](https://www.python.org/) respectively) it was pretty easy to communicate over HTTPS between the two. When a user would login to Common Ground, the following process took place:

* Login request sent to Common Ground
* Common Ground forwards the login request to Inscribe over HTTPS
* Inscribe checks the user's credentials and returns a [JSON Web Token](https://self-issued.info/docs/draft-ietf-oauth-json-web-token.html)(JWT)
* Common Ground sends the JWT back to the user to be stored client side

 Common Ground and Inscribe shared the same JWT secret key, which is used to determine the validity of JWT claims. Sharing the JWT secret key between the two back ends made it so Common Ground could validate claims for Inscribe JWTs instead of checking with the Inscribe back end every time the user tried to do something.

## Front end lessons from Inscribe

After the [lessons I learned from Inscribe]({{< relref "projects/inscribe.md#figuring-out-the-front-end" >}}), I immediately chose to use AngularJS for Common Ground's front end. Using the same front end framework across both Inscribe and Common Ground had the added benefit of allowing me to reuse code across the two projects. Being able to use the same code was a boost in Common Ground up and running quickly.

## Iterate early, iterate often

Today Common Ground is no longer in use. After extensive user testing, Pomegranate Lab determined that a different approach was needed to help teachers better connect with their students. This project later iterated into [The Playbook](/projects/playbook/).

When it was around, Common Ground looked like this:

![Inscribe Img](/img/cg-combined.png)
