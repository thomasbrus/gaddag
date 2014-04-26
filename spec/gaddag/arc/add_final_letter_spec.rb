require 'gaddag'

describe GADDAG::Arc, '#add_final_letter' do
  subject { GADDAG::Arc.new(GADDAG::Node.new) }

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
