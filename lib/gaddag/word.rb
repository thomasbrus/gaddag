# encoding: utf-8

class GADDAG

  # Represents a word in the GADDAG data structure
  class Word
    # The letters that make up this word
    attr_reader :letters

    # Initializes a GADDAG word
    # @param letters [Array<String>] an ordered list of letters of which
    # the word consists
    # @return [Word]
    def initialize(letters)
      @letters = letters
    end

    # Returns the word as string
    # @return a string representation of the word
    def to_s
      @letters.join
    end

    # Construct a list of delimited GADDAG paths from this word
    # @return [Array<Path>] a list of paths, each containing a reversed prefix,
    # a delimiter, and a suffix: REV(PREFIX) ♢ SUFFIX
    def to_delimited_paths
      1.upto(letters.length - 1).map do |index|
        reversed_prefix = @letters.slice(0, index).reverse
        suffix = @letters.slice(index, @letters.count)
        Path.new(reversed_prefix + [Path::DELIMITER] + suffix)
      end
    end
  end

end
