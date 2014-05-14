# encoding: utf-8

class GADDAG

  # Represents a (final) path within the GADDAG data structure
  class Path
    # The letters that make up this GADDAG path
    attr_reader :letters

    # Two paths are equal if they contain the same letters in the same order
    send :include, Equalizer.new(:letters)

    # The path delimiter that seperates the reversed prefix and the suffix
    DELIMITER = '♢'.freeze

    # Initializes a GADDAG path
    # @param letters [Array<String>] a list of letters, containing a reversed prefix,
    # a delimiter, and an optional suffix: REV(PREFIX) ♢ SUFFIX
    # @return [Path]
    def initialize(letters)
      @letters = letters
    end

    # Returns the reversed prefix of this path
    # @return [Array<String>] the first portion of this path: the reversed prefix
    def reversed_prefix_letters
      return [] if @letters.empty?
      @letters.join.split(DELIMITER).first.chars
    end

    # Returns the suffix of this path
    # @return [Array<String>] the last portion of this path: the suffix
    def suffix_letters
      return [] unless include_delimiter?
      @letters.join.split(DELIMITER).last.chars
    end

    # Tells whether the path includes {GADDAG::DELIMITER}
    # @return [Boolean] whether this path includes the delimiter
    def include_delimiter?
      @letters.include?(DELIMITER)
    end

    # Returns a string presentation of this path
    # @return the string represtentation, letters are delimited with '>'
    def to_s
      @letters.join(' > ')
    end

    # Coerces into an Array.
    # @example
    #   ['K', 'E'] + Path.new(%w(A R B)) # => ['K', 'E', 'A', 'R', 'B']
    # @return [Array<String>] the letters in this path
    def to_ary
      @letters
    end

    # Constructs a word from the partially reversed letter path
    # @return [Word] the word that is encoded within this path
    def to_word
      Word.new(reversed_prefix_letters.reverse + suffix_letters)
    end
  end

end
