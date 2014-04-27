# encoding: utf-8

require 'gaddag'

describe GADDAG::Node, '#create_path' do
  subject { GADDAG::Node.new }

  let(:letters) { %w[B ♢ R E A K] }

  def follow_arc(node, letter)
    node.outgoing_arcs.fetch(letter).destination
  end

  def follow_arcs(node, letters)
    return node if letters.empty?
    follow_arc(node, letters[0]).follow_arcs(letters[1..-1])
  end

  context 'when not given a list of destination nodes' do
    let!(:final_node) { subject.create_path(letters) }

    it 'creates the path for the given letters' do
      expect { follow_arcs(subject, letters) }.to_not raise_error
    end

    it 'returns the last created node' do
      expect(final_node).to equal(follow_arcs(subject, letters))
    end
  end

  context 'when given a list of destination nodes' do
    let(:destinations) { 6.times.map { GADDAG::Node.new } }
    let!(:final_node) { subject.create_path(letters, destinations) }

    it 'creates the path for the given letters through the given destination nodes' do
      expect(follow_arcs(subject, %w[B])).to equal(destinations[0])
      expect(follow_arcs(subject, %w[B ♢])).to equal(destinations[1])
      expect(follow_arcs(subject, %w[B ♢ R])).to equal(destinations[2])
      expect(follow_arcs(subject, %w[B ♢ R E])).to equal(destinations[3])
      expect(follow_arcs(subject, %w[B ♢ R E A])).to equal(destinations[4])
      expect(follow_arcs(subject, %w[B ♢ R E A K])).to equal(destinations[5])
    end

    it 'returns the last destination node' do
      expect(final_node).to equal(destinations[5])
    end
  end

  context 'when given a shortened list of destination nodes' do
    let(:destinations) { 3.times.map { GADDAG::Node.new } }
    let!(:final_node) { subject.create_path(letters, destinations) }

    it 'creates the path for the given letters through the shortened list of destination nodes' do
      expect(follow_arcs(subject, %w[B])).to equal(destinations[0])
      expect(follow_arcs(subject, %w[B ♢])).to equal(destinations[1])
      expect(follow_arcs(subject, %w[B ♢ R])).to equal(destinations[2])
      expect { follow_arcs(subject, letters) }.to_not raise_error
    end

    it 'returns the last created node' do
      expect(final_node).to equal(follow_arcs(subject, letters))
    end
  end
end
