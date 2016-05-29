---
layout: post
title: "Yet another introduction to concurrency"
date: 2016-04-01
categories: software
---

TL DR; I've started to professionally work with programming in 2011. One year later, I
discovered the Ruby language and fell in love with it. Since then I worked with
a plenty of projects and never worried about concurrency.  In the meanwhile,
there were some discussions on how Ruby is inefficient in terms of
concurrency. This instigated me to study the topic to really understand what
was happening.

After reading Seven Concurrency Models in seven weeks, I noticed that some of
developers (even seniors), had the same lack of knowledge as I had. Fot this
reason I'm sharing this article with you.

## Why is everyone talking about it?

The first thing we need to understand is: _why this is a hot topic?_? Why old
environment, like Haskell and Erlang are gaining popularity? Why new languages
are arising with concurrency in mind, like Golang, Rust and
Elixir? The main reason is: __Multicore Crisis__.

### Moore's law

In order to really understand the __Multicore Crisis__, we need to go back to
1965, when Gordon Moore made an observation that says:

>  The number of transistors per square inch on integrated circuits had doubled
>  every year since the integrated circuit was invented.

But what it means? In an updated version, it means that:
_"The machine processing power tends to double every 18 months_". However,
we're experiencing a slow down in the pace of this observation due to problems
like: heat leakage and energy consumption. So, Instead of shipping doubled faster chips
every 18 months, the industry took another direction: __Multicores__.

### Multicore

When the industry took this way, not only _hardware production_ was affected, but
also the way we write software. For several decades, Software Engineers enjoyed
free performance gains. However, today if you want fully exploit your machine,
you need to exploit parallelism.
