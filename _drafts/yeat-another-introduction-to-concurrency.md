---
layout: post
title:  "[draft] Yet another introduction to concurrency"
date:   2016-03-29 12:28:00
categories: concurrency
---


Concurrency is a hot topic nowadays. There are many people talking about, some
complaining about Ruby, some expressing some love for Closure, Go, Elixir,
Haskel, Scala etc… The goal of this article is to deliver a simple and clear
introduction and answer why this is a topic that every developer should be
aware of.

## Why this is a hot topic?

Short answer: __Multicore crisis__.

In 1965, Gordon Moore (Co-founder of Intel) quote the following:

> The number of transistors in a dense integrated circuit double approximately
> every two years. Wikipedia

It became known as the famous __Moore's Law__. But, recently we're
experiencing a __natural__ reducing of pace of this observation. We cannot make  things (in
this case transistors) smaller forever. Beyond that fact, single super fast chips
increase problems with __heat__ and __energy consumption__.

So, the __Moore's Law__ continues to deliver, but instead as a _single
super chip_, we're seeing every day more and more cores integrating a single CPU.

## The free lunch is over!

For several decades, developers enjoyed free performance gains in their
application even they did not make any code improvement. The primarily
reason for that is that CPU manufacturers were delivering faster components
along the way. But now, if you want to take fully advantage of your machine performance, you need to
exploit parallelism!

## Concurrency vs Parallelism

They're not the same thing, but if you archive
concurrency you can easily archieve parallelism.

As Roby Pike says:

> __Concurrency__ is about dealing with lots of things at once.
> __Parallelism__ is about doing lots of things at once.

Take this method as example:
{% gist 4349bb3de396edf3cbd16236e5a2d4f3 short_concurrent_example.rb %}
[Full code example here](https://gist.github.com/nandosousafr/4349bb3de396edf3cbd16236e5a2d4f3#file-concurrent_example-rb)

At __line 2__ we're firing futures (executing processes idependently), and at
__line 5__ making the composition of results. So, Concurrency is
programming as the __composition__ of independently executing processes.

Parallelism is programming as the __simultaneous__ execution of (possibly
related) computations. [improve it].

