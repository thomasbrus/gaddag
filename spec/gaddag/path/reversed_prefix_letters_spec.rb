require 'gaddag'

describe GADDAG::Path, '#reversed_prefix_letters' do
  context 'when the path includes a delimiter' do
    subject { GADDAG::Path.new(%w(R B ♢ E A K)) }

    it 'returns an ordered list of letters that occur before the delimiter' do
      expect(subject.reversed_prefix_letters).to eq(%w(R B))
    end
  end

  context 'when the path does not include a delimiter' do
    subject { GADDAG::Path.new(%w(K A E R B)) }

    it 'returns an ordered list of all the letters within the path' do
      expect(subject.reversed_prefix_letters).to eq(%w(K A E R B))
    end
  end
end