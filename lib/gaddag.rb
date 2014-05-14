# encoding: utf-8

require 'equalizer'

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
  # @return [GADDAG] the GADDAG instance
  def add(word)
    @root.create_final_path(word.chars.reverse + [Path::DELIMITER])

    Word.new(word.chars).to_delimited_paths.each do |path|
      @root.create_final_path(path.letters)
    end

    self
  end

  # Finds all words that contain the given substring
  # @param substring [String] the substring to search for
  # @return [Array<String>] all matching words
  def find(substring)
    reversed_prefix_letters = substring.reverse.chars
    @root.follow_path(reversed_prefix_letters).find_final_paths.map do |path|
      Path.new(reversed_prefix_letters + path).to_word.to_s
    end.uniq
  rescue KeyError
    []
  end
end
