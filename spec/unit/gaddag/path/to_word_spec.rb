require 'gaddag'

describe GADDAG::Path, '#to_word' do
  context 'when the path is empty' do
    subject { GADDAG::Path.new([]) }

    it 'returns an empty word' do
      expect(subject.to_word).to eq(GADDAG::Word.new([]))
    end
  end

  context 'when the path includes a delimiter' do
    subject { GADDAG::Path.new(%w(R B ♢ E A K)) }

    it 'returns a word with the letters in the correct order' do
      expect(subject.to_word).to eq(GADDAG::Word.new(%w(B R E A K)))
    end
  end

  context 'when the path does not include a delimiter' do
    subject { GADDAG::Path.new(%w(K A E R B)) }

    it 'returns a word with the letters in the correct order' do
      expect(subject.to_word).to eq(GADDAG::Word.new(%w(B R E A K)))
    end
  end
end
