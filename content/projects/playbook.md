+++
date = "2015-07-07T14:47:09-05:00"
draft = false
title = "The Playbook"
description = "A practical guide to the Growth Mindset"
categories = ["HTML", "React", "webpack", "JavaScript", "ES6", "Parse", "Bootstrap"]
+++

## A practical guide to the Growth Mindset

The Playbook is a webapp I worked on for [Pomegranate Lab](http://pomegranatelab.com/) with the purpose of helping teachers create and find lesson plans based on the [Growth Mindset](http://mindsetonline.com/whatisit/about/).

## Back Ends with Parse

Development for The Playbook needed to begin quickly and to be in a semi usable state as fast as possible because Pomegranate Lab wanted it to help enhance their coaching sessions with teachers. Due to the expedited nature of the project, I decided to give [Parse](https://www.parse.com/) a try. In simplified terms, Parse handles back end functionality for your app so you only have code the front end. Database tables, user functionality, emails, and hosting are all handled by Parse. Parse provides libraries for several platforms and/or languages that allow you to interact with your app's "back end". For The Playbook I wrote a [Single Page Application](https://en.wikipedia.org/wiki/Single-page_application) that loaded the proper Parse data when each page opened.

## Using React for an easy to understand UI

To build the front end, I decided to use [React](https://facebook.github.io/react/). React is an excellent JavaScript library for building UIs. It encourages you to separate functionality into 'components', which are then used like traditional HTML tags. Since code is treated as separate units, this makes code easier to organize and very easy for humans to read. For instance the HTML to display the collapsible menu is:

```
<SlideMenu>
  <MenuItems></MenuItems>
  <MenuPanel >{this.props.children}</MenuPanel>
</SlideMenu>
```

But it rendered as:

![Menu Image](/img/menu-demo.gif)

## ES6 bringing JavaScript development to the 21st Century

Unfortunately most browsers don't support the newest JavaScript functionality out of the box, and there are same [great improvements](https://github.com/lukehoban/es6features) coming in future versions ofJavaScript. With this in mind, I decided to use the [Babel](https://babeljs.io/) transpiler to write the new ES6 JavaScript for The Playbook and convert it the current JavaScript that most browsers expect. The let me use modern JavaScript features such as promises, lambdas, and classes. Since the entire front end was essentially a single page JavaScript webapp, I used [webpack](https://webpack.github.io/) to bundle all the assets into static files that could be served from the Parse servers.

[The Playbook](https://playbook.parseapp.com) is still in use, however it is in closed beta for teachers.
