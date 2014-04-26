# encoding: utf-8

require_relative 'gaddag/arc'
require_relative 'gaddag/node'
require_relative 'gaddag/path'
require_relative 'gaddag/word'

# Implementation of the GADDAG data structure
class GADDAG
  # The root node
  attr_reader :root

  # Initializes a GADDAG
  # @return [GADDAG]
  def initialize
    @root = Node.new
  end

  # Adds a word to the GADDAG
  # @param word [String] the word to be added
  # @return [GADDAG] the GADDAG instance itself
  def add(word)
    @root.create_final_path(word.reverse.chars)

    Word.new(word.chars).to_paths.each do |path|
      node = @root.create_path(path.reversed_prefix_letters)
      node.create_final_path([Path::DELIMITER] + path.suffix_letters)
    end

    self
  end

  # Finds all words that contain the given substring
  # @param substring [String] the substring to search for
  # @return [Array<Word>] all matching words
  def find(substring)
    reversed_prefix_letters = substring.reverse.chars
    @root.follow_arcs(reversed_prefix_letters).find_paths.map do |path|
      Path.new(reversed_prefix_letters + path).to_word.to_s
    end
  rescue KeyError
    []
  end
end
