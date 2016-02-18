# My Ruby Implementation of CRC32 algorythm

## Challenge

Write a Ruby extension that provides a binding to a CRC32 implementation.
We would like you to write it, not copy-paste it in its entirety, and really play. Do any Googling or githubbing or whatever you like
in the process.

The starting point is here:
https://blog.fastmail.com/2015/12/03/the-search-for-a-faster-crc32/

Your input is a file on the filesystem, 5 megabytes in size. The output CRC32 value must be the same as the one Zlib provides.

What we would like to see is how you approach the problem, the extension should have tests and benchmarks
(at least agains the Zlib implementation, but also against other CRC32 extensions for Ruby if they do exist). If the
benchmarks prove that it is not faster - it is also good, because what we are doing here is not shooting for a result that
beats all the others but we are exploring.

You are completely free to choose the implementations you want to try hooking into the extension.

If you hit a roadblock doing this, or if you notice some results of your experiment are baffling, we would like to see how
you communicate what you have encountered.

It would be nice if you could do this in an open Git repo so that we can look at your explorations in detail. The extension
should easily build and run on OSX 10.10 or above and on Linux.

## Implementation notes

### I read the following articles:

https://blog.fastmail.com/2015/12/03/the-search-for-a-faster-crc32/

https://pl.wikipedia.org/wiki/Cykliczny_kod_nadmiarowy

https://gist.github.com/szymon33/4e754d3a849eb07b954e

### Idea

I decided to implement algorythm more or less the following idea:

1. Take the first 32 bits.
1. Shift bits
1. If 32 bits are less than DIVISOR, goto step 2.
1. XOR 32 bits by DIVISOR. Goto step 2.

So as you see it is without lookup table initially.

### Miscellaneous

# Gem

The propose of this repository is to be a library for other programms. Thus, example usage with banchmarks is here:

You have to put the following in your gemfile:



**Specs**

I put some basic spacs

**Ruby bit operations**

operator  description
& The AND operator
| The OR operator
^ The XOR operator
~ The NOT (complement) operator
« The left shift operator
» The right shift operator

**Negative nubmers**

Negative numbers are represented by toggling the roles of the ones and zeros. Instead of starting at zero, negative numbers starts at -1, which is represented using all ones, and are counted downward using zeros towards a minimum of -2(n-1). In the case of a 4 bit number that would be -2(4-1) = -8 or 1000.
