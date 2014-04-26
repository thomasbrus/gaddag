require 'gaddag'

describe GADDAG::Word, '#to_s' do
  context 'when the word is empty' do
    let(:word) { GADDAG::Word.new([]) }

    it 'returns an empty string' do
      expect(word.to_s).to be_empty
    end
  end

  context 'when the word is not empty' do
    let(:word) { GADDAG::Word.new(%w(B R E A K)) }

    it 'concatenates the letters in this word' do
      expect(word.to_s).to eq('BREAK')
    end
  end
end
