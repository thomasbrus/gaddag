# encoding: utf-8

require 'gaddag'

describe GADDAG, '#initialize' do
  subject { GADDAG.new }

  it 'sets the root node the a new, empty node' do
    expect(subject.root).to eq(GADDAG::Node.new)
  end
end
