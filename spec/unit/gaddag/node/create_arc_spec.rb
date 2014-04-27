require 'gaddag'
require 'shared/unit/gaddag/node/create_arc_examples'

describe GADDAG::Node, '#create_arc' do
  subject { GADDAG::Node.new }
  it_behaves_like 'GADDAG::Node#create_arc'
end
