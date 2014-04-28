# encoding: utf-8

require 'gaddag'
require 'shared/unit/gaddag/arc_context'

describe GADDAG::Arc, '#initialize' do
  include_context 'GADDAG::Arc/context'

  it 'initializes an empty set of final letters' do
    expect(subject.final_letters).to be_empty
  end

  it 'stores the destination node' do
    expect(subject.destination).to equal(destination)
  end
end
