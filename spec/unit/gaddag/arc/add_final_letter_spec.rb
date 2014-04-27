# encoding: utf-8

require 'gaddag'
require 'shared/unit/gaddag/arc_context'

describe GADDAG::Arc, '#add_final_letter' do
  include_context GADDAG::Arc

  context 'when adding a final letter' do
    before { subject.add_final_letter('K') }

    it 'is added' do
      expect(subject.final_letters).to eq(%w[K].to_set)
    end
  end

  context 'when adding a final letter twice' do
    before { 2.times { subject.add_final_letter('L') } }

    it 'is only added once' do
      expect(subject.final_letters).to eq(%w[L].to_set)
    end
  end
end
