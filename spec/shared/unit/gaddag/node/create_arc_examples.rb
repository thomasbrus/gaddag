# encoding: utf-8

shared_examples 'GADDAG::Node#create_arc' do
  let(:letter) { 'L' }
  let(:destination) { GADDAG::Node.new }

  let(:create_arc) { ->(*args) { subject.create_arc(*args) } }

  let(:arc) { create_arc.call(letter) }
  let(:another_arc) { create_arc.call(letter) }

  let(:arc_with_destination) { create_arc.call(letter, destination) }

  it 'returns the newly created arc' do
    expect(arc).to be_an_instance_of(GADDAG::Arc)
  end

  it 'adds the arc to the mapping of outgoing arcs' do
    expect(subject.outgoing_arcs).to include(letter => arc)
  end

  context 'when not provided with a destination node' do
    it 'points the arc to a newly created destination node' do
      expect(arc.destination).to eq(GADDAG::Node.new)
    end
  end

  context 'when provided with a destination node' do
    it 'points the arc to the given destination node' do
      expect(arc_with_destination.destination).to equal(destination)
    end
  end

  context 'when created again for the same letter' do
    it 'returns the original arc' do
      expect(another_arc).to equal(arc)
    end
  end
end
