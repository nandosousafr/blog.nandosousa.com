---
layout: post
title: "Learning elixir by building bots"
date: 2017-01-15
categories: elixir
---

I've started to work professionally with programming in 2011. One year later, I
have discovered the Ruby language and have fallen in love with it. Since then
I've worked on a plenty of projects and have never worried about concurrency.
Meanwhile, there have been some discussions on how Ruby is inefficient
in terms of concurrency. These discussions instigated me to dig into the topic to
understand what was happening.

After some time studying it, I noticed that some of the developers (even
seniors) that I know, had the same lack of knowledge as I had. That's the
reason I'm writing this article: an attempt to help you if you have the same
gap.

## Why is everyone talking about it?

The first thing we need to understand is: why is this a hot topic? Why old
languages, like Haskell and Erlang are gaining popularity? Why new languages
are arising with concurrency in mind, like Golang, Rust, and Elixir? The main
reason is the Multicore Crisis.

