# encoding: utf-8

require 'gaddag'

describe GADDAG::Word, '#==' do
  context 'when two words contain the same letters' do
    context 'when the letters are in the same order' do
      let(:word) { GADDAG::Word.new(%w(B R E A K)) }
      let(:other_word) { GADDAG::Word.new(%w(B R E A K)) }
      specify { expect(word).to eq(other_word) }
    end

    context 'when the letters are in a different order' do
      let(:word) { GADDAG::Word.new(%w(B R E A K)) }
      let(:other_word) { GADDAG::Word.new(%w(R E B A K)) }
      specify { expect(word).to_not eq(other_word) }
    end
  end

  context 'when two words contain different letters' do
    let(:word) { GADDAG::Word.new(%w(B R E A K)) }
    let(:other_word) { GADDAG::Word.new(%w(C A R E)) }
    specify { expect(word).to_not eq(other_word) }
  end
end
