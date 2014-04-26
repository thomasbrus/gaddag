require 'gaddag'

describe GADDAG::Word, '#to_delimited_paths' do
  context 'when the word is empty' do
    let(:word) { GADDAG::Word.new([]) }

    it 'returns an empty list' do
      expect(word.to_delimited_paths).to be_empty
    end
  end

  context 'when the word consists of a single letter' do
    let(:word) { GADDAG::Word.new(%w(A)) }

    it 'returns an empty list' do
      expect(word.to_delimited_paths).to be_empty
    end
  end

  context 'when the word consists of multiple letters' do
    let(:word) { GADDAG::Word.new(%w(B R E A K)) }
    let(:delimited_paths) { word.to_delimited_paths }

    it 'returns a list with n-1 paths' do
      expect(delimited_paths.count).to eq(4)
    end

    it 'returns a list delimited paths' do
      expect(delimited_paths).to include(GADDAG::Path.new(%w(B ♢ R E A K)))
      expect(delimited_paths).to include(GADDAG::Path.new(%w(R B ♢ E A K)))
      expect(delimited_paths).to include(GADDAG::Path.new(%w(E R B ♢ A K)))
      expect(delimited_paths).to include(GADDAG::Path.new(%w(A E R B ♢ K)))
    end
  end
end
