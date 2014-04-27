# encoding: utf-8

require 'gaddag'

describe GADDAG::Word, '#==' do
  context 'when two words have the same letters' do
    let(:word) { GADDAG::Word.new(%w[B R E A K]) }
    let(:other_word) { GADDAG::Word.new(%w[B R E A K]) }
    specify { expect(word).to eq(other_word) }
  end

  context 'when two words have different letters' do
    let(:word) { GADDAG::Word.new(%w[B R E A K]) }
    let(:other_word) { GADDAG::Word.new(%w[C A R E]) }
    specify { expect(word).to_not eq(other_word) }
  end
end
