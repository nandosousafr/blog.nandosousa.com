---
layout: post
title:  "Yet another introduction to concurrency"
date:   2016-03-29 12:28:00
categories: concurrency
---


Concurrency is a hot topic nowadays. There are many people talking about, some
complaining about Ruby, some expressing some love for Closure, Go, Elixir,
Haskel, Scala etc… The goal of this article is to deliver a simple and clear
introduction and answer why this is a topic that every developer should be
aware of.

## Why this is a hot topic?

Simple answer: __Multicore crisis__. In 1965, Gordon Moore (Co-founder of
Intel) quote the following:

> The number of transistors in a dense integrated circuit double approximately
> every two years. Wikipedia

This observation became known as the famous __Moore's Law__. But, recently we're
experiencing a __natural__ reducing of pace. We cannot make  things (in
this case transistors) smaller forever. Beside that fact, single super fast chips
increase problems with __heat__ and __energy consumption__.

Conclusion, the __Moore's Law__ continues to deliver, but instead as a _single
super chip_, we're seeing every day more cores integrating a single CPU.

## The free lunch is over!





