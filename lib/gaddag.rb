# encoding: utf-8

require "equalizer"

require_relative "gaddag/arc"
require_relative "gaddag/node"
require_relative "gaddag/path"
require_relative "gaddag/word"

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
    first_letter = substring.chars[0]
    second_letter = substring.chars[1]
    last_letters = Array(substring.chars[2..-1])

    return Array.new unless @root.path?(last_letters.reverse)

    @root.follow_path(last_letters.reverse).final_paths.select do |path|
      path.start_with?([second_letter, first_letter])
    end.map do |path|
      Path.new(last_letters.reverse + path).to_word.to_s
    end.uniq
  end
end
