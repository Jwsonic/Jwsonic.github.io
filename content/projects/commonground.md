+++
date = "2014-07-25T14:47:09-05:00"
draft = false
title = "Common Ground"
description = "Teacher-centric lesson planning"
categories = ["HTML", "Go", "AngularJS", "Bootstrap", "Heroku", "Stripe"]
+++

## Teacher-centric lesson planning

Common Ground, a companion webapp to [Inscribe](/projects/inscribe/), enabled teachers with Inscribe accounts to create lesson plans for their current  courses. Teachers could also export their lesson plans and collaborate with other teachers on shared lesson plans.

## Talking to Inscribe

For the back end I chose to use the [Go](http://golang.org/) programming language instead of [Python](https://www.python.org/), which Inscribe was written in. I had been using Go in my side projects and I had come to appreciate its strengths of speed, simplicity, and robustness. I structured the back end as a series of REST endpoints for the front end to query when it needed data.

Common Ground used Inscribe as its Single Sign-On server. User login requests were passed to Inscribe and the user would be given a [JSON Web Token](https://self-issued.info/docs/draft-ietf-oauth-json-web-token.html) with their user information. This made it very easy to share user data across the two webapps.

## Front end lessons from Inscribe

I immediately chose to use AngularJS for Common Ground's front end to avoid the previous pain points experienced while iterating on Inscribe's front end. Using the same front end framework across both Inscribe and Common Ground allowed me to reuse similar code pieces across the two projects.

## Iterate early, iterate often

Today Common Ground is no longer in use. After extensive user testing, Pomegranate Lab determined that a different approach was needed to help teachers better connect with their students. This project later iterated into [The Playbook](/projects/playbook/).

When it was around, Common Ground looked like this:

![Inscribe Img](/img/cg-combined.png)
