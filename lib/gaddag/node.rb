# encoding: utf-8

class GADDAG

  class Node
    def initialize
      @outgoing_arcs = {}
    end

    def create_arc(letter, destination = Node.new)
      @outgoing_arcs[letter] ||= Arc.new(destination)
    end

    def create_final_arc(letter, final_letter, destination = Node.new)
      create_arc(letter, destination).tap { |arc| arc.add_final_letter(final_letter) }
    end

    def create_path(letters, destinations = [])
      letters.each_with_index.inject(self) do |node, (letter, index)|
        node.create_arc(letter, destinations[index] || Node.new).destination
      end
    end

    def create_final_path(letters, destinations = [])
      *initial_letters, second_last_letter, last_letter = *letters
      last_node = create_path(initial_letters, destinations)
      last_node.create_final_arc(second_last_letter, last_letter).destination
    end
  end

end
