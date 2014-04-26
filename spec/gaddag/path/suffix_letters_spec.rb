require 'gaddag'

describe GADDAG::Path, '#suffix_letters' do
  context 'when the path includes a delimiter' do
    subject { GADDAG::Path.new(%w(R B ♢ E A K)) }

    it 'returns an ordered list of letters that occur after the delimiter' do
      expect(subject.suffix_letters).to eq(%w(E A K))
    end
  end

  context 'when the path does not include a delimiter' do
    subject { GADDAG::Path.new(%w(K A E R B)) }

    it 'returns an empty list' do
      expect(subject.suffix_letters).to be_empty
    end
  end
end
