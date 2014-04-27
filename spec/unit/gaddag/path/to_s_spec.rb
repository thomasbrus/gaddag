# encoding: utf-8

require 'gaddag'

describe GADDAG::Path, '#to_s' do
  context 'when the path is empty' do
    subject { GADDAG::Path.new([]) }
    specify { expect(subject.to_s).to be_empty }
  end

  context 'when the path is not empty' do
    subject { GADDAG::Path.new(%w(B ♢ R E A K)) }

    it 'concatenates the letters in this path, delimited by \' > \'' do
      expect(subject.to_s).to eq('B > ♢ > R > E > A > K')
    end
  end
end
