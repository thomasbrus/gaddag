# encoding: utf-8

shared_context 'GADDAG::Node#create_path/context' do
  subject { GADDAG::Node.new }
  let(:letters) { %w[B ♢ R E A K] }
end
