# encoding: utf-8

require 'gaddag'
require 'shared/unit/gaddag/node/create_arc_behaviour'

describe GADDAG::Node, '#create_arc' do
  it_behaves_like 'GADDAG::Node#create_arc/behaviour'
end
