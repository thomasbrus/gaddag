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
      @root.create_final_path(path)
    end

    self
  end

  # Finds all words that contain the given substring
  # @param substring [String] the substring to search for
  # @return [Array<String>] all matching words
  def find(substring)
    first_letter, second_letter, *last_letters = *substring.chars
    return [] unless @root.path?(last_letters.reverse)

    @root.follow_path(last_letters.reverse).final_paths.select do |path|
      path.start_with?([second_letter, first_letter])
    end.map do |path|
      Path.new(last_letters.reverse + path).to_word.to_s
    end.uniq
  end
end
