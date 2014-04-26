# GADDAG data structure in Ruby

A [GADDAG](http://en.wikipedia.org/wiki/GADDAG) is a data structure that
allows for fast lookup of words by substring. It is a directed acyclic graph, where
each word can be constructed from the root via any of its reversed prefixes. Its main application
is move generation in Scrabble. The data structure is explained in more detail in
[the original research paper](http://www.ericsink.com/downloads/faster-scrabble-gordon.pdf).

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
IO.foreach('/usr/share/dict/words').map(&:chomp).each do |word|
  if word.length == 10
    gaddag.add(word) # => #<Gaddag:0x007fc6c24367b0 ... >
  end
end
```

It is possible to remove words as well. If no matching word was found,
`nil` is returned.

```ruby
gaddag.remove('television') # => 'television'
gaddag.remove('fargo') # => nil
```

In order to find all words that contain a given substring, use the `find` method:

```ruby
gaddag.find('elevi') => # ["televiewer", "television", "televisual"]
```
