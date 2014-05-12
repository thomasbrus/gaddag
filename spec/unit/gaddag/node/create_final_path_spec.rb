# encoding: utf-8

require 'gaddag'
require 'shared/unit/gaddag/node/create_path_context'
require 'shared/unit/gaddag/node/create_final_path_behaviour'

describe GADDAG::Node, '#create_final_path' do
  context 'when not given a list of destination nodes' do
    it_behaves_like 'GADDAG::Node#create_final_path/behaviour'
  end

  context 'when given a list of destination nodes' do
    it_behaves_like 'GADDAG::Node#create_final_path/behaviour' do
      let(:letters) { %w[B ♢ R E A K] }

      let!(:destinations) { 6.times.map { GADDAG::Node.new } }
      let!(:final_node) { subject.create_final_path(letters, destinations) }

      it 'creates the path for the given letters through the given destination nodes' do
        expect(subject.follow_path(%w[B])).to equal(destinations[0])
        expect(subject.follow_path(%w[B ♢])).to equal(destinations[1])
        expect(subject.follow_path(%w[B ♢ R])).to equal(destinations[2])
        expect(subject.follow_path(%w[B ♢ R E])).to equal(destinations[3])
        expect(subject.follow_path(%w[B ♢ R E A])).to equal(destinations[4])
      end
    end
  end

  context 'when given a shortened list of destination nodes' do
    it_behaves_like 'GADDAG::Node#create_final_path/behaviour' do
      let(:letters) { %w[B ♢ R E A K] }

      let(:destinations) { 3.times.map { GADDAG::Node.new } }
      let!(:final_node) { subject.create_final_path(letters, destinations) }

      it 'creates a path through the shortened list of destination nodes' do
        expect(subject.follow_path(%w[B])).to equal(destinations[0])
        expect(subject.follow_path(%w[B ♢])).to equal(destinations[1])
        expect(subject.follow_path(%w[B ♢ R])).to equal(destinations[2])
      end
    end
  end
end
