# GADDAG data structure in Ruby

A [GADDAG](http://en.wikipedia.org/wiki/GADDAG) is a data structure that
allows for fast lookup of words by substring. It is a directed acyclic graph, where
each word can be constructed from the root via any of its reversed prefixes. Its main application
is move generation in Scrabble. The data structure is explained in more detail in
[the original research paper](http://www.ericsink.com/downloads/faster-scrabble-gordon.pdf).

[![Gem Version](https://badge.fury.io/rb/gaddag.svg)](https://rubygems.org/gems/gaddag)
[![Build Status](http://img.shields.io/travis/thomasbrus/gaddag/master.svg)](http://travis-ci.org/thomasbrus/gaddag?branch=master)
[![Dependency Status](http://img.shields.io/gemnasium/thomasbrus/gaddag.svg)](https://gemnasium.com/thomasbrus/gaddag)
[![Code Climate](http://img.shields.io/codeclimate/github/thomasbrus/gaddag.svg)](https://codeclimate.com/github/thomasbrus/gaddag)

## Installation

The `gaddag` gem is [available via Rubygems](https://rubygems.org/gems/gaddag).
Install the gem by adding it to your Gemfile or by running:

    gem install gaddag

## Usage

Initializing the GADDAG is simple:

```ruby
require 'gaddag'
gaddag = GADDAG.new
```

Adding words is done via the `add` method. This will expand the graph with paths for all
the reversed prefixes of the word. Note that this may take some time when adding
a large number of words.

```ruby
File.readlines('/usr/share/dict/words') do |word|
  gaddag.add(word.strip) if word.strip.length == 10 # => #<Gaddag:0x007fc6c24367b0 ... >
end
```

In order to find all words that contain a given substring, use the `find` method:

```ruby
gaddag.find('elevi') => # ["televiewer", "television", "televisual"]
```

## Examples

- [dictionary.rb](examples/dictionary.rb)

## License

See [LICENSE.txt](LICENSE.txt).
