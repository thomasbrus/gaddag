require 'gaddag'

describe GADDAG::Arc, '#initialize' do
  let(:destination) { GADDAG::Node.new }
  subject { GADDAG::Arc.new(destination) }

  it 'initializes an empty final letters set' do
    expect(subject.final_letters).to be_empty
  end

  it 'stores the destination node' do
    expect(subject.destination).to equal(destination)
  end
end
