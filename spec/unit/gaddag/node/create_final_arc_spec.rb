# encoding: utf-8

require 'gaddag'

describe GADDAG::Node, '#create_final_arc' do
  subject { GADDAG::Node.new }

  let(:final_letter) { 'Z' }

  it_behaves_like 'GADDAG::Node#create_arc' do
    let(:create_arc) do
      ->(*args) { subject.create_final_arc(*args.insert(1, final_letter)) }
    end

    it 'adds the final letter to the arc' do
      expect(arc.final_letters).to include(final_letter)
    end
  end
end
