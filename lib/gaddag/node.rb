# encoding: utf-8

class GADDAG

  # Represents a node in the GADDAG data structure
  class Node
    # A mapping of letters to arcs
    attr_reader :outgoing_arcs

    # Two nodes are equal if they have the same set of outgoing arcs
    include Equalizer.new(:outgoing_arcs)

    # Initializes a GADDAG node
    # @return [Node]
    def initialize
      @outgoing_arcs = {}
    end

    # Creates an outgoing arc for a letter to a destination node
    # @param letter [String] the letter to be added to the path when this
    # arc is followed
    # @param destination [Node] the node to which this arc should point
    # @return [Arc] the newly created arc or an existing arc if one already
    # exists for this letter
    def create_arc(letter, destination = Node.new)
      @outgoing_arcs[letter] ||= Arc.new(destination)
    end

    # Creates a final outgoing arc for a letter to a destination node. Effectively
    # this will add a final letter to the outgoing arc, indicating that a valid
    # word can be formed with it.
    # @see #create_arc
    def create_final_arc(letter, final_letter, destination = Node.new)
      create_arc(letter, destination).tap { |arc| arc.add_final_letter(final_letter) }
    end

    # Recursively creates a path for a list of letters and optional destination nodes
    # @param letters [Array<String>] the letters for which the path should be build
    # @param destinations [Array<Node>] the destination nodes which the path should visit
    # @return [Node] the lastly created destination ode
    def create_path(letters, destinations = [])
      letters.each_with_index.inject(self) do |node, (letter, index)|
        node.create_arc(letter, destinations[index] || Node.new).destination
      end
    end

    # Recursively creates a path for a list of letters and optional destination nodes,
    # ommiting the last node, and marking the last letter as final
    # @see #create_path
    def create_final_path(letters, destinations = [])
      *initial_letters, second_last_letter, last_letter = *letters
      last_node = create_path(initial_letters, destinations)
      last_node.create_final_arc(second_last_letter, last_letter).destination
    end

    # Follows a single outgoing arc for a given letter
    # @param letter [String] the letter that should be followed
    # @raise [KeyError] if no outgoing arc exists for the given letter
    # @return [Node] the destination node that the arc for this letter leads to
    def follow_arc(letter)
      @outgoing_arcs.fetch(letter).destination
    end

    # Recursively follows a list of letters
    # @param letters [Array<String>] the letters to be followed
    # @return [Node] the destination node that the path of letters leads to
    # @see #follow_arc
    def follow_arcs(letters)
      return self if letters.empty?
      follow_arc(letters[0]).follow_arcs(letters[1..-1])
    end

    # Returns all paths from this node that are final
    # @return [Array<Path>] a list of final paths
    def find_final_paths
      return [] if @outgoing_arcs.empty?
      @outgoing_arcs.map { |letter, arc|
        arc.find_final_paths.map { |path| Path.new([letter] + path) }
      }.flatten(1)
    end
  end

end
