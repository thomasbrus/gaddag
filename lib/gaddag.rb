# encoding: utf-8

require_relative 'gaddag/arc'
require_relative 'gaddag/node'

class GADDAG
  DELIMITER = '♢'.freeze

  def initialize
    @root = Node.new
  end

  def add(word)
    @root.create_final_path(word.reverse.chars)

    generate_delimited_words(word).each do |word|
      reversed_prefix, suffix = word.split(DELIMITER)
      last_prefix_node = @root.create_path(reversed_prefix.chars)
      last_prefix_node.create_final_path([DELIMITER] + suffix.chars)
    end
  end

  # def remove(word)
  #   ...
  # end

  # def find(substring)
  #   ...
  # end

  private

  def generate_delimited_words(word)
    1.upto(word.length - 1).map do |index|
      reversed_prefix = word.slice(0, index).reverse
      suffix = word.slice(index, word.length - index)
      reversed_prefix << DELIMITER << suffix
    end
  end
end
