+++
date = "2015-09-01T14:47:09-05:00"
draft = false
title = "File Grabber"
description = "Grabbing files from your server directly in your browser"
categories = ["HTML", "Go", "React", "Bootstrap", "websockets"]
+++

## The Why

My wife, Jesyka, and I have a small server in our apartment that we back up photos and documents to. The server runs Ubuntu and its pretty easy to access our files through FTP or SSH. However, sometimes we like to download photos or files to our phones and most Android FTP clients are cumbersome or lacking features. After looking around I found [gohttp](https://github.com/itang/gohttp) which is very close to what I wanted. I took this as an opportunity to build a webapp similar to gohttp that would fit our exact needs and let me learn some new tricks along the way.

## Requirements

The initial requirements for File Grabber were:

* Ability to view, download, and delete files and folders.
* Real time updates(ie if a file is deleted on the server, it is immediately removed from the browser)
* Single binary installation like gohttp
* Be fully [responsive](https://en.wikipedia.org/wiki/Responsive_web_design)

## Behind every good developer is a designer

Jes designed stuff. Show design mocks here.


## Front end with React and Redux

After using [React](https://facebook.github.io/react/) to build [The Playbook]({{< relref "projects/playbook.md#using-react-for-an-easy-to-understand-ui" >}}) it has quickly become my favorite way to build webapp front ends. One thing React is not designed for is managing your application state. Facebook(the creator of React) recommends using the [Flux](https://facebook.github.io/flux/) architecture for React apps. When I did more research on Flux, I found out that there are [many flux implementations](https://github.com/voronianski/flux-comparison) to choose from. Eventually I decided to use a method similar to Flux called [Redux](http://rackt.github.io/redux/). Redux in its own words is "[...a predictable state container for JavaScript apps.](http://rackt.github.io/redux/)".

The core idea behind Redux is that your application state is stored as a read only data structure. Updates to application state are done via [pure functions](https://en.wikipedia.org/wiki/Pure_function) called reducers. Reducers take a state and an action as parameters and return an updated application state:

```
(state, action) => newState
```

## Talking to the backend

## Deploying a single binary

## Check out the code

The code for file grabber is available on [github](https://github.com/Jwsonic/file-grabber).
