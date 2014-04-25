# encoding: utf-8

require 'trie'

class GADDAG
  KEY_DELIMITER = '>'.freeze

  def initialize
    @trie = Trie.new
  end

  def add(word)
    self.tap { generate_keys(word) { |key| @trie.insert(key, word) } }
  end

  def remove(word)
    self.tap { |w| @trie.delete_value(w) }
  end

  def find(substring)
    @trie.find_prefix(substring.reverse).values
  end

  private

  def generate_keys(word)
    1.upto(word.length) do |index|
      reversed_prefix = word.slice(0, index).reverse
      suffix = word.slice(index, word.length - index)
      yield reversed_prefix << KEY_DELIMITER << suffix
    end
  end
end
