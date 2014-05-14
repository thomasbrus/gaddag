# encoding: utf-8

require 'gaddag'

describe GADDAG::Path, '#reversed_prefix_letters' do
  context 'when the path is empty' do
    subject { GADDAG::Path.new([]) }
    specify { expect(subject.reversed_prefix_letters).to be_empty }
  end

  context 'when the path includes a delimiter' do
    subject { GADDAG::Path.new(%w[R B] + [GADDAG::Path::DELIMITER] + %w[E A K]) }

    it 'returns an ordered list of letters that occur before the delimiter' do
      expect(subject.reversed_prefix_letters).to eq(%w[R B])
    end
  end

  context 'when the path ends with a delimiter' do
    subject { GADDAG::Path.new(%w[K A E R B] + [GADDAG::Path::DELIMITER]) }

    it 'returns an ordered list of all the letters within the path' do
      expect(subject.reversed_prefix_letters).to eq(%w[K A E R B])
    end
  end

  context 'when the path does not include a delimiter' do
    subject { GADDAG::Path.new(%w[K A E R B]) }

    it 'returns an ordered list of all the letters within the path' do
      expect(subject.reversed_prefix_letters).to eq(%w[K A E R B])
    end
  end
end
