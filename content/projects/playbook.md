+++
date = "2015-07-07T14:47:09-05:00"
draft = false
title = "The Playbook"
description = "A practical guide to the Growth Mindset"
categories = ["HTML", "React", "webpack", "JavaScript", "ES6", "Parse", "Node.js", "npm"]
+++

## A practical guide to the growth mindset

The Playbook is a webapp I worked on for [Pomegranate Lab](http://pomegranatelab.com/). Its purpose is to enable teachers studying the [Growth Mindset](http://mindsetonline.com/whatisit/about/) to find and shard Growth Mindset-based lesson content. The Playbook had the following set of requirements:

* create a landing page explaining the Growth Mindset
* allow teachers to create an account
* allow teachers to submit "Plays", which are essentially lesson plans targeting specific Growth Mindset elements
* plays need to be search-able by teachers, either through full-text search or a variety of categories
* enable teachers to add Plays to their "Playbook" for quick access later
* allow admins to curate the front-page content, approve Plays, and add new users

## Back ends with Parse

Pomegranate Lab wanted to use the Playbook for its Growth Mindset coaching sessions, so development needed to begin quickly. Due to the expedited nature of the project, I decided to use [Parse](https://www.parse.com/) to cut out a majority of the work in back end development. According to Parse's documentation: "[Our goal is to totally eliminate the need for writing server code or maintaining servers](https://www.parse.com/docs/js/guide#getting-started)".

Database tables, user authentication/permissions, emails, and hosting are all set up using the Parse configuration console. In the rare case you do need to do something special for your back end, Parse has "Cloud Code" functions. Cloud Code is, in reality, just a node.js environment to run your code on Parse servers. Parse provides libraries for several platforms and/or languages that allow you to interact with your app's "back end". Parse also had support for React, which will come into play later.

Setting up all tables (or classes as Parse calls them) and their relations was a snap. Add/dropping columns only took a few clicks, which enabled me to quickly build and iterate on The Playbook's various features. Data permissions are set by assigning user roles and then giving those roles [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) permissions for different data classes.

## Using React for an easy to understand UI

To build the front end, I decided to use a library I had been hearing a lot about called [React](https://facebook.github.io/react/). React is "[A JavaScript library for building user interfaces](https://facebook.github.io/react/)" created by Facebook. It encourages you to separate UI functionality into small pieces called 'components'. Components take application state as parameters and returns what should be displayed. Since code is separated into units usually focused around a single functionality, components are very easy to test and human readable. For example the code to display The Playbook's collapsible menu is:

```
<SlideMenu>
  <MenuItems></MenuItems>
  <MenuPanel>{this.props.children}</MenuPanel>
</SlideMenu>
```

Which renders as the following:

![Menu Image](/img/menu-demo.gif)

This kind of logical project structure and readability was something I dreamed about when working on other projects.

## ES6 bringing JavaScript development to the 21st century

Unfortunately most browsers do not support the newest JavaScript functionality out of the box, and there are same [great improvements](https://github.com/lukehoban/es6features) coming in future versions of JavaScript. For example a simple function to add 5 to a number might look like this in the current version of JavaScript:

```
function addFive(num) {
  return num + 5;
}
```

But with the newer versions of JavaScript, the code could be condensed down into something more readable like:

```
let addFive = (num) => num + 5;
```

With this in mind, I decided to use the [Babel](https://babeljs.io/) transpiler to write the front end code in ES6 JavaScript. Babel takes your ES6 JavaScript code and converts it into ES5 (the current standard) JavaScript that browsers today expect. This let me use modern JavaScript features such as promises, lambdas, and classes in the development of The Playbook.

## Putting it all together with webpack

Building a single page webapp with JavaScript is a bit different that building a traditional webapp. You have lots of small (mostly js) files that cause pages to load slowly, since it starts a new request for each file. Ideally you could combine files of similar types during your build process and make your webapp load much faster. This is where webpack comes in.

[webpack](https://webpack.github.io/) is a module bundler that bundles all your webapp's files and condenses them into static files for easy hosting. JavaScript is concatenated and minified (most whitespace and newlines are removed) into a single js file that is loaded by a main.html file. webpack also gives you the ability to install npm libraries as project dependencies and use them in your front end. It also plays well with font end only libraries, React and Parse in our case, trimming unused code and shrinking your overall project size.

Configuring webpack can be a bit of a challenge the first time, but once set up the build process for The Playbook was very simple:

* Run webpack
* Upload output files to Parse
* You're done!

[The Playbook](https://playbook.parseapp.com) is still in use, however, it is in closed beta for teachers.
