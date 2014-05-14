# encoding: utf-8

require 'gaddag'
require 'pp'

gaddag = GADDAG.new

IO.foreach(ARGV.first || '/usr/share/dict/words').map(&:strip).map do |word|
  if word.length == 10
    puts "Adding '#{word}' to the GADDAG..."
    gaddag.add(word)
  end
end

pp gaddag.find('elev')
