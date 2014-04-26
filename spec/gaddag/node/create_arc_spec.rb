require 'gaddag'

describe GADDAG::Node, '#create_arc' do
  subject { GADDAG::Node.new }
  let(:destination) { GADDAG::Node.new }
  let(:another_destination) { GADDAG::Node.new }

  context 'when created for the first time' do
    let(:arc) { subject.create_arc('L', destination) }

    it 'returns the newly created arc' do
      expect(arc).to eq(GADDAG::Arc.new(destination))
    end
  end

  context 'when created again for the same letter' do
    let(:first_arc) { subject.create_arc('L') }
    let(:second_arc) { subject.create_arc('L', destination) }

    it 'returns the first arc each time' do
      expect(second_arc).to equal(first_arc)
    end

    it 'will ignore setting the destination the second time' do
      expect(first_arc.destination).to_not equal(destination)
    end
  end

  context 'when not provided with a specific destination' do
    before { subject.create_arc('L') }

    it 'creates an arc for the given letter pointing to a newly created destination' do
      expect(subject.follow_arc('L')).to eq(GADDAG::Node.new)
      expect(subject.follow_arc('L')).to_not equal(destination)
    end
  end

  context 'when provided with a specific destination' do
    before { subject.create_arc('L', destination) }

    it 'creates an arc for the given letter pointing to that destination' do
      expect(subject.follow_arc('L')).to equal(destination)
    end
  end
end
