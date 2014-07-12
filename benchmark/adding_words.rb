# encoding: utf-8

require 'gaddag'
require 'benchmark/ips'
require 'pp'

dictionary = 10_000.times.map do
  rand(2..12).times.map { ('a'..'z').to_a.sample }.join
end

fixed_length_dictionary = dictionary.select do |word|
  word.length == 7
end

Benchmark.ips do |x|
  gaddag = GADDAG.new

  x.report("random words, random length") do
    gaddag.add(dictionary.sample)
  end

  gaddag = GADDAG.new

  x.report("random words, fixed length") do
    gaddag.add(fixed_length_dictionary.sample)
  end

  x.compare!
end

