# encoding: utf-8

shared_context 'GADDAG::Node#follow_arc/context' do
  def create_arc(node, letter, destination = GADDAG::Node.new)
    node.outgoing_arcs[letter] ||= GADDAG::Arc.new(destination)
  end
end
