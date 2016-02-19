# My Ruby Implementation of CRC32 algorythm

## Challenge

Write a Ruby extension that provides a binding to a CRC32 implementation.
We would like you to write it, not copy-paste it in its entirety, and really play. Do any Googling or githubbing or whatever you like
in the process.

The starting point is here:
https://blog.fastmail.com/2015/12/03/the-search-for-a-faster-crc32/

Your input is a file on the filesystem, 5 megabytes in size. The output CRC32 value must be the same as the one Zlib provides.

What we would like to see is how you approach the problem, the extension should have tests and benchmarks (at least agains the Zlib implementation, but also against other CRC32 extensions for Ruby if they do exist). If the
benchmarks prove that it is not faster - it is also good, because what we are doing here is not shooting for a result that beats all the others but we are exploring.

You are completely free to choose the implementations you want to try hooking into the extension.

If you hit a roadblock doing this, or if you notice some results of your experiment are baffling, we would like to see how you communicate what you have encountered.

## Implementation notes

### I read the following articles:

https://blog.fastmail.com/2015/12/03/the-search-for-a-faster-crc32/

https://pl.wikipedia.org/wiki/Cykliczny_kod_nadmiarowy

https://gist.github.com/szymon33/4e754d3a849eb07b954e

### Idea

I decided to implement more or less the following algorythm idea:

1. Take the first 32 bits.
1. Shift bits left.
1. If there is 0 on most significient bit, goto step 2.
1. XOR 32 bits by QUOTIENT. Goto step 2.

The QUOTIENT for CRC32 is 0x04C11DB7. Polynomial reprezentation is:

```x32 + x26 + x23 + x22 + x16 + x12 + x11 + x10 + x8 + x7 + x5 + x4 + x2 + x + 1```

Note: we can use shifting the crc reg right instead of left by using a reversed 32-bit word to represent the polynomial. Reversed 32-bit word is '0xEDB88320'.

So as you can see I stick to bit-oriented approach but not to a table-driven (lookup).

### Gem

This repository is a start point of implementation gem `crc32`.

Framework work with Ruby version 2.1. You can add it to your Gemfile with:

```ruby
gem 'crc32', git: 'git@github.com:szymon33/crc32.git', branch: 'master', tag: 'v0.0.2'
```

Run the bundle command to install it.

You can review usage of this gem in the **[sample application](https://github.com/szymon33/crc32-container)**. Please note that I use git's tags here but not branches.

Both repositories are public but not published [on the RubyGems.org site](https://rubygems.org/gems). If there is any problem with `bundler` then you could install `crc32` gem like the following as well:

```ruby
git clone git@github.com:szymon33/crc32.git

gem build crc32.gemspec

gem install crc32

```


### Miscellaneous

My solutions is slower then zlib's but it has very clear idea.

**Specs**

I wrote some basic spacs just to be sure there everyting is always fine. To inspect them you have to run

```
bundle exec rspec
```


### My notes

**Ruby bit operations**

operator  description

⋅⋅⋅ ```&``` The AND operator
⋅⋅⋅ ```|``` The OR operator
⋅⋅⋅ ```^``` The XOR operator
⋅⋅⋅ ```~``` The NOT (complement) operator
⋅⋅⋅ ```<<``` The left shift operator
⋅⋅⋅ ```>>``` The right shift operator

**Negative nubmers**

Negative numbers are represented by toggling the roles of the ones and zeros. Instead of starting at zero, negative numbers starts at -1, which is represented using all ones, and are counted downward using zeros towards a minimum of -2(n-1). In the case of a 4 bit number that would be -2(4-1) = -8 or 1000.
