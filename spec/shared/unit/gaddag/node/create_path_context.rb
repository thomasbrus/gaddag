# encoding: utf-8

shared_context 'GADDAG::Node#create_path/context' do
  subject { GADDAG::Node.new }
  let(:letters) { %w[B ♢ R E A K] }

  def follow_arc(node, letter)
    node.outgoing_arcs.fetch(letter).destination
  end

  def follow_arcs(node, letters)
    return node if letters.empty?
    follow_arc(node, letters[0]).follow_arcs(letters[1..-1])
  end
end
