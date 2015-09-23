+++
date = "2015-09-01T14:47:09-05:00"
draft = false
title = "File Grabber"
description = "Grabbing files from your server directly in your browser"
categories = ["HTML", "Go", "React", "Bootstrap", "websockets"]
+++

## The why

There is a small server in our apartment that my wife and I use to back-up photos and documents. The server runs Ubuntu and it's pretty easy to access our files through FTP or SSH. However, sometimes we like to download photos or files to our mobile devices and most Android FTP clients are cumbersome or lacking features. After a bit of research, I found [gohttp](https://github.com/itang/gohttp), which is very close to what we wanted, but not quite. I took this as an opportunity to build a webapp similar to gohttp that would fit our exact needs and allow me to learn some new tricks along the way.

## Requirements

The initial requirements for File Grabber were:

* ability to view, download, and delete files and folders
* real-time updates (i.e. if a file is deleted on the server, it is immediately removed from the browser)
* single binary installation like gohttp
* has to run on Ubuntu
* be fully [responsive](https://en.wikipedia.org/wiki/Responsive_web_design)

<!--
## Behind every good developer is a designer

Jes designed stuff. Show design mocks here. -->

## Front end with React and Redux

After using [React](https://facebook.github.io/react/) to build [The Playbook]({{< relref "projects/playbook.md#using-react-for-an-easy-to-understand-ui" >}}) it has quickly become my favorite way to build webapp front ends. One thing React is not designed for is managing your application state. Facebook (the creator of React) recommends using the [Flux](https://facebook.github.io/flux/) architecture for React apps. When I did more research on Flux, I found out that there are [many flux implementations](https://github.com/voronianski/flux-comparison) to choose from. Eventually I decided to use a method similar to Flux called [Redux](http://rackt.github.io/redux/). Redux, in its own words, is "[...a predictable state container for JavaScript apps.](http://rackt.github.io/redux/)".

The core idea behind Redux is that your application state is stored as a read only data structure. Updates to application state are done via [pure functions](https://en.wikipedia.org/wiki/Pure_function) called reducers. Reducers take a state and an action as parameters and return an updated application state:

```
(state, action) => newState
```

A sample state for file grabber could look something like:

```
{
  ui: {
    deleteModal: {
      open: true,
      fileName: 'photo.jpg'
    }
  },
  fileData: {
    files: [{
      name: 'photo.jpg',
      size: 100000
      modTime: 19219319191,
      isDir: false
      }],
    path: '/'
  },
  server: {
    connected: true
  }
}
```

## JavaScript talking to Go

In order to get updates in real-time, File Grabber uses [WebSockets](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API) to send messages between the front end in the browser and the back end on the server. When File Grabber is first loaded into the browser it attempts to connect to the File Grabber websocket server. Once a connection has been established between the front and back ends the message passing can begin. The back end will send CREATE/UPDATE/DELETE messages whenever changes are made to the watched folder. The front end will send DELETE/FILES messages to the server as the user interacts with the files in the UI.

## Careful, inotify is watching you

Since only linux is currently supported for the File Grabber back end, we use [inotify](https://en.wikipedia.org/wiki/Inotify) to watch the file system for changes. The Go standard library contains a [wrapper for inotify](https://godoc.org/golang.org/x/exp/inotify), but out of the box it doesn't watch folders recursively. Since the server is not aware of each browser's current path it needs to watch for changes at every level of the watched file tree.

To solve this problem I wrote my own wrapper of the Go inotify called RecursiveWatcher. RecursiveWatcher also simplifies inotify's events down to just Create, Modify, and Delete. Watching for file events on a RecursiveWatcher uses a Go channel just like the normal inotify wrapper. For instance, watching the current directory could look something like:

```
rWatcher, _ := watcher.NewRecursiveWatcher(".")
events := rWatcher.Watch()

for {
  event := <-events

  switch event.Type {
    case watcher.Delete:
      fmt.Printf("%s deleted\n", event.Name)
    case watcher.Modify:
      fmt.Printf("%s modified\n", event.Name)
    case watcher.Create:
      fmt.Printf("%s created\n", event.Name)
  }
}
```

## Deploying as a single binary

[go-bindata](https://github.com/jteeuwen/go-bindata) is an excellent library that takes a file or directory as input, compresses the data, and embeds the compressed bytes into a Go file. You can then access the compressed data through a function with the signature of ```Asset(string) ([]byte, error)```. For File Grabber I used the compiled go-bindata command line tool to compress all the front end files into a single Go file. The data from this asset file is then served over HTTP as the front end.

## Check it out

The code for file grabber is available on [github](https://github.com/Jwsonic/file-grabber).
