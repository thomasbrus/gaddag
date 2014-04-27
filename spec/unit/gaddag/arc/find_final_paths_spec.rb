# encoding: utf-8

require 'gaddag'
require 'shared/unit/gaddag/arc_context'

describe GADDAG::Arc, '#find_final_paths' do
  include_context GADDAG::Arc

  let(:first_final_path) { GADDAG::Path.new(%w(A B C)) }
  let(:second_final_path) { GADDAG::Path.new(%w(D E F)) }

  context 'when the arc includes no final letters' do
    context 'when the destination node has no final paths' do
      specify { expect(subject.find_final_paths).to be_empty }
    end

    context 'when the destination node has final paths' do
      before { destination.create_final_path(first_final_path.letters) }
      before { destination.create_final_path(second_final_path.letters) }

      specify { expect(subject.find_final_paths).to include(first_final_path) }
      specify { expect(subject.find_final_paths).to include(second_final_path) }
      specify { expect(subject.find_final_paths.count).to eq(2) }
    end
  end

  context 'when the arc does include final letters' do
    before { %w(X Y).each { |l| subject.add_final_letter(l) } }

    context 'when the destination node has no final paths' do
      specify { expect(subject.find_final_paths).to include(GADDAG::Path.new(%w(X))) }
      specify { expect(subject.find_final_paths).to include(GADDAG::Path.new(%w(Y))) }
      specify { expect(subject.find_final_paths.count).to eq(2) }
    end

    context 'when the destination node has final paths' do
      before { destination.create_final_path(first_final_path.letters) }
      before { destination.create_final_path(second_final_path.letters) }

      specify { expect(subject.find_final_paths).to include(GADDAG::Path.new(%w(X))) }
      specify { expect(subject.find_final_paths).to include(GADDAG::Path.new(%w(Y))) }

      specify { expect(subject.find_final_paths).to include(first_final_path) }
      specify { expect(subject.find_final_paths).to include(second_final_path) }

      specify { expect(subject.find_final_paths.count).to eq(4) }
    end
  end
end
