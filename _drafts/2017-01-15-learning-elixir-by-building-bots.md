---
layout: post
title: "Learning elixir by building bots"
date: 2017-01-15
categories: elixir
---

Learn a new language is not an easy task. It demands you persistence,
open mindness and most important: hunbleness. But sometimes, the content
that you're using to learn is very distant of your daily basis reality, making
more dificult to get the point.

Today, we're going to build, test and deploy a _Messenger bot_ using Elixir.
I hope this process helps you to understand the language basics.

### A Messenger Bot is nothing more than a web app

I think that creating a Bot is very didatic way to learn a language, because
it's just a web application.

Basically, whenever someone interact with your bot via chat, An event is sent by
Facebook to a predefined endpoint in your application. If you want to reply
this event with a message, you can you use the [Send
API](https://developers.facebook.com/docs/messenger-platform/send-api-reference).
Simple as that.

![Facebook Bot Messenger platform diagram](/assets/messenger-bot-diagram.png)

### Getting started

Assuming that you have [Elixir installed](http://elixir-lang.org/install.html), let's 
create our bot application by running:

```
$ mix new my_bot --sup
$ cd my_bot
```
