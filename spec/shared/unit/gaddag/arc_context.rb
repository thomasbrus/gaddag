# encoding: utf-8

shared_context 'GADDAG::Arc/context' do
  subject { GADDAG::Arc.new(destination) }
  let(:destination) { GADDAG::Node.new }
end
