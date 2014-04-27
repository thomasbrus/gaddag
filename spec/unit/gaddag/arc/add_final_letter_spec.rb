# encoding: utf-8

require 'gaddag'
require 'shared/unit/gaddag/arc_context'

describe GADDAG::Arc, '#add_final_letter' do
  include_context GADDAG::Arc

  context 'when the arc includes no final letters' do
    context 'when adding a final letter' do
      before { subject.add_final_letter('K') }
      specify { expect(subject.final_letters).to eq(%w(K).to_set) }
    end
  end

  context 'when the arc does include final letters' do
    before { %w(E L M).each { |l| subject.add_final_letter(l) } }

    context 'when adding a final letter' do
      before { subject.add_final_letter('K') }
      specify { expect(subject.final_letters).to eq(%w(E L M K).to_set) }
    end

    context 'when adding a final letter that has already been added' do
      before { subject.add_final_letter('E') }
      specify { expect(subject.final_letters).to eq(%w(E L M).to_set) }
    end
  end
end
