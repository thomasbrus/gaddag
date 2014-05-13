# encoding: utf-8

require 'gaddag'

describe GADDAG::Node, '#arc?' do
  subject { GADDAG::Node.new }

  let(:letter) { 'L' }

  context 'when the arc for the given letter exists' do
    before { subject.create_arc(letter) }

    it 'returns true' do
      expect(subject.arc?(letter)).to eq(true)
    end
  end

  context 'when the arc for the given letter does not exist' do
    it 'returns false' do
      expect(subject.arc?(letter)).to eq(false)
    end
  end
end
