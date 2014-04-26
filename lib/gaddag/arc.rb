# encoding: utf-8

require 'set'

class GADDAG

  # Represents an arc pointing to a destination node with optional final letters
  class Arc
    # The destination node
    attr_reader :destination

    # A set of letters which form a word after being appended to the letter path
    attr_reader :final_letters

    # Initializes a GADDAG arc
    # @param destination [Node] the destination node
    # @return [Arc]
    def initialize(destination)
      @destination = destination
      @final_letters = Set.new
    end

    # Adds a final letter to the arc. A final letter is a letter that,
    # when appended to the letter path, forms a valid word.
    # @param letter [String] the letter that is to be marked as final
    def add_final_letter(letter)
      @final_letters.add(letter)
    end
  end

end
