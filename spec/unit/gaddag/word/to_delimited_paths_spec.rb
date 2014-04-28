# encoding: utf-8

require 'gaddag'

describe GADDAG::Word, '#to_delimited_paths' do
  context 'when the word is empty' do
    subject { GADDAG::Word.new([]) }
    specify { expect(subject.to_delimited_paths).to be_empty }
  end

  context 'when the word consists of a single letter' do
    subject { GADDAG::Word.new(%w[A]) }
    specify { expect(subject.to_delimited_paths).to be_empty }
  end

  context 'when the word consists of multiple letters' do
    subject { GADDAG::Word.new(%w[B R E A K]) }
    let(:delimited_paths) { subject.to_delimited_paths }

    it 'returns a list of delimited paths' do
      expect(delimited_paths).to match_array([
        GADDAG::Path.new(%w[B] + [GADDAG::Path::DELIMITER] + %w[R E A K]),
        GADDAG::Path.new(%w[R B] + [GADDAG::Path::DELIMITER] + %w[E A K]),
        GADDAG::Path.new(%w[E R B] + [GADDAG::Path::DELIMITER] + %w[A K]),
        GADDAG::Path.new(%w[A E R B] + [GADDAG::Path::DELIMITER] + %w[K])
      ])
    end
  end
end
