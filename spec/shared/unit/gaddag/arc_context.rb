# encoding: utf-8

shared_context GADDAG::Arc do
  let(:destination) { GADDAG::Node.new }
  subject { GADDAG::Arc.new(destination) }
end
