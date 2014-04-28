# encoding: utf-8

require 'gaddag'

describe GADDAG::Node, '#follow_arc' do
  subject { GADDAG::Node.new }

  let(:letter) { 'L' }
  let(:destination) { GADDAG::Node.new }

  context 'when the arc for the given letter exists' do
    before { subject.create_arc(letter, destination) }

    it 'returns the destination node that the arc points to' do
      expect(subject.follow_arc(letter)).to equal(destination)
    end
  end

  context 'when the arc for the given letter does not exist' do
    it 'raises an error indicating that no such arc exists' do
      expect { subject.follow_arc(letter) }.to raise_error(KeyError)
    end
  end
end
