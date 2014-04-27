# encoding: utf-8

require 'gaddag'

describe GADDAG::Path, '#include_delimiter?' do
  context 'when the path includes a delimiter' do
    subject { GADDAG::Path.new(%w[B ♢ R E A K]) }
    specify { expect(subject.include_delimiter?).to be_true }
  end

  context 'when the path does not include a delimiter' do
    subject { GADDAG::Path.new(%w[K A E R B]) }
    specify { expect(subject.include_delimiter?).to be_false }
  end
end
