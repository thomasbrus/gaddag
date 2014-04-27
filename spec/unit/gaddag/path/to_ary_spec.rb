# encoding: utf-8

require 'gaddag'

describe GADDAG::Path, '#to_ary' do
  subject { GADDAG::Path.new(%w[B ♢ R E A K]) }

  it 'is implemented' do
    expect(subject).to respond_to(:to_ary)
  end

  it 'returns its letter list' do
    expect(subject.to_ary).to eq(subject.letters)
  end
end
