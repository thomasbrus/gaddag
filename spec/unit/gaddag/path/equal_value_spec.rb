# encoding: utf-8

require 'gaddag'

describe GADDAG::Path, '#==' do
  context 'when two paths contain the same letters' do
    context 'when the letters are in the same order' do
      let(:path) { GADDAG::Path.new(%w(B ♢ R E A K)) }
      let(:other_path) { GADDAG::Path.new(%w(B ♢ R E A K)) }
      specify { expect(path).to eq(other_path) }
    end

    context 'when the letters are in a different order' do
      let(:path) { GADDAG::Path.new(%w(B ♢ R E A K)) }
      let(:other_path) { GADDAG::Path.new(%w(R B ♢ E A K)) }
      specify { expect(path).to_not eq(other_path) }
    end
  end

  context 'when two paths contain different letters' do
    let(:path) { GADDAG::Path.new(%w(B ♢ R E A K)) }
    let(:other_path) { GADDAG::Path.new(%w(C ♢ A R E)) }
    specify { expect(path).to_not eq(other_path) }
  end
end
