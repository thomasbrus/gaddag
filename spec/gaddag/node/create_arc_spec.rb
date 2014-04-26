require 'gaddag'

describe GADDAG::Node, '#create_arc' do
  subject { GADDAG::Node.new }
  let(:letter) { 'L' }
  let(:destination) { GADDAG::Node.new }
  let(:another_destination) { GADDAG::Node.new }

  context 'when created for the first time' do
    let(:arc) { subject.create_arc(letter, destination) }

    it 'returns the newly created arc' do
      expect(arc).to eq(GADDAG::Arc.new(destination))
    end
  end

  context 'when created again for the same letter' do
    let(:first_arc) { subject.create_arc(letter) }
    let(:second_arc) { subject.create_arc(letter, destination) }

    it 'returns the first arc each time' do
      expect(second_arc).to equal(first_arc)
    end

    it 'will ignore setting the destination the second time' do
      expect(first_arc.destination).to_not equal(destination)
    end
  end

  context 'when not provided with a specific destination' do
    before { subject.create_arc(letter) }

    it 'creates an arc for the given letter pointing to a newly created destination' do
      expect(subject.follow_arc(letter)).to eq(GADDAG::Node.new)
      expect(subject.follow_arc(letter)).to_not equal(GADDAG::Node.new)
    end
  end

  context 'when provided with a specific destination' do
    before { subject.create_arc(letter, destination) }

    it 'creates an arc for the given letter pointing to that destination' do
      expect(subject.follow_arc(letter)).to equal(destination)
    end
  end
end
