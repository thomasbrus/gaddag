# encoding: utf-8

require 'gaddag'

describe GADDAG::Path, '#initialize' do
  let(:letters) { %w(B ♢ R E A K) }
  subject { GADDAG::Path.new(letters) }

  it 'stores the list of letters' do
    expect(subject.letters).to equal(letters)
  end
end
