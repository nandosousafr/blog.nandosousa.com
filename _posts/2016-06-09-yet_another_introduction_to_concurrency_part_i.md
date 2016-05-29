---
layout: post
title: "(Part I) Yet another introduction to concurrency"
date: 2016-06-09
categories: software
---

I’ve started to professionally work with programming in 2011. One year
later, I discovered the Ruby language and fell in love with it. Since then I
worked with a plenty of projects and never worried about concurrency. In the
meanwhile, there were some discussions on how Ruby is inefficient in terms of
concurrency. This instigated me to study the topic to really understand what
was happening.

After some time studying it, I noticed that some of the developers (even
seniors) that I Know had the same lack of knowledge in this subject as I had.
For this reason, I wrote this article as an attempt to fill this gap.

## Why is everyone talking about it?

The first thing we need to understand is: _why this is a hot topic?_? Why old
languages, like Haskell and Erlang are gaining popularity? Why new languages
are arising with concurrency in mind, like Golang, Rust, and Elixir? The main
reason is: _Multicore Crisis_.

### Moore's law

In order to really understand the __Multicore Crisis__, we need to go back to
1965, when Gordon Moore made an observation that says:

>  The number of transistors per square inch on integrated circuits had doubled
>  every year since the integrated circuit was invented.

But what it means? In an updated version, it means that: _"The machine
processing power tends to double every 18 months_". However, we're experiencing
a slowdown in the pace of this observation due to problems like heat leakage
and energy consumption. So, Instead of shipping 2x faster chips every 18
months, the industry took another direction: _Multicores_.

### Multicore

When the industry took this way, not only _hardware production_ was affected,
but also the way we write software. For several decades, Software Engineers
enjoyed free performance gains due to CPU optimizations predicted by Moore's
law.  However, today if you want fully exploit your machine, you need to
exploit __parallelism__.

### Concurrency vs Parallelism

You may say:
> Parallelism? you're talking about concurrency, why did you mention
> Parallelism? And they are the same thing, right?

Actually, _concurrency_ and _parallelism_ are not the same. let's dive into it a
little bit.

Roby pike gave a brilliant [talk](https://www.youtube.com/watch?v=cN_DpYBzKso)
about it. On it, he explains that parallelism is the simultaneous execution
of things, possibly related, possibly not. And concurrency is programming as
the __composition__ of independently executing processes. For languages that do
not provide direct support for parallelism, you must concurrently
__structure__ your program in order to achieve parallelism.

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
