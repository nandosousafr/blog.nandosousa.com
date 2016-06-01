---
layout: post
title: "(Part I) Yet another introduction to concurrency"
date: 2016-06-09
categories: software
---

I've started to professionally work with programming in 2011. One year later, I
have discovered the Ruby language and have fallen in love with it. Since then
I've worked on a plenty of projects and have never worried about concurrency.
Meanwhile, there have been some discussions on how Ruby is inefficient in terms
of concurrency. This instigated me to study the topic to really understand what
was happening.

After sometime studying it, I noticed that some of
developers (even seniors), had the same lack of knowledge as I had. That's the
reason  I'm writing  this article: an attempt to help you if you have the
same gap.

## Why is everyone talking about it?

The first thing we need to understand is: _why is this a hot topic?_? Why old
languages, like Haskell and Erlang are gaining popularity? Why new languages
are arising with concurrency in mind, like Golang, Rust, and Elixir? The main
reason is: _Multicore Crisis_.

### Moore's law
In order to really understand the Multicore Crisis, we need to go back to 1965,
when Gordon Moore made an observation:

>  The number of transistors per square inch on integrated circuits had doubled
>  every year since the integrated circuit was invented.


But what it means? In an updated version, it means: _"The machine processing
power tends to double every 18 months"_. However, we're experiencing a slow down
in the pace of this observation due to problems like: heat leakage and energy
consumption. So, instead of shipping 2x faster chips every 18 months, the
industry took another direction: _Multicores_.

### Multicore

When the industry took this path, not only hardware manufacturing was affected, but
also the way we write software. For several decades, Software Engineers enjoyed
free performance gains. However, today if you want to fully exploit your machine,
you need to exploit parallelism.

### Concurrency vs Parallelism

You may ask:
> Parallelism? you're talking about concurrency, why did you mention
> Parallelism? And they are the same thing, right?

Actually, _concurrency_ and _parallelism_ are not as the same. Let's dive into it a
little bit.

Roby pike has given a brilliant
[talk](https://www.youtube.com/watch?v=cN_DpYBzKso) about it. He explains
parallelism as the simultaneous execution of things, possibly related, possibly
not. On the other hand, concurrency is programming as the composition of
independently executing processes. For languages that do not provide direct
support for parallelism, you must concurrently structure your program in order
to achieve parallelism.

Take this code as example:

{% highlight ruby linenos %}
require 'concurrent'
require 'httparty'

USERS = [
           'nandosousafr', 'jeanmantheussouto',
           'thiesen', 'pcasaretto', 'hugoluchessi',
           'jeanholderbaum', 'aureliosaraiva'
        ]

def get_followers_count(user)
  endpoint_url = "http://api.github.com/users/#{user}/followers"
  response = HTTParty.get(endpoint_url)
  raise unless response.status == 200
  response.count
end

def execute_concurrently
  futures = USERS.collect do |user|
    Concurrent::Future.execute { get_followers_count(user) }
  end
  futures.collect {|future| future.value }
end
{% endhighlight %}

Take a look at lines 18..20, here's a `collect` block that is firing a
future for each item in `USERS` array, in other words, they are __processes
being executed independently__. Now, look at line 21, here, all the triggered
futures values are being collected, making the __composition of independently
executing processes__.

![Concurrent code example](/assets/post_1_example_1.jpg)

## What's next?

In the next post, we're going to take a look at __Shared Memory Concurrent
Model (Threads, locks, and everything)__. Until then, check it out at following references:

- [[Book] Seven concurrent models in seven weeks](https://pragprog.com/book/pb7con/seven-concurrency-models-in-seven-weeks);
- [[Talk] Everything You Know About the GIL](https://www.youtube.com/watch?v=dP4U1yI1WZ0);
- [[Article] The free lunch is over!](www.gotw.ca/publications/concurrency-ddj.htm);
