# encoding: utf-8

require 'set'

class GADDAG
  class Arc
    # The destination node
    attr_reader :destination

    # The letters which complete a word after following this arc.
    attr_reader :final_letters

    def initialize(destination)
      @destination = destination
      @final_letters = Set.new
    end

    def add_final_letter(letter)
      @final_letters.add(letter)
    end
  end
end
