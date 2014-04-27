# encoding: utf-8

require 'gaddag'

describe GADDAG::Path, '#==' do
  context 'when two paths have the same letters' do
    let(:path) { GADDAG::Path.new(%w[B ♢ R E A K]) }
    let(:other_path) { GADDAG::Path.new(%w[B ♢ R E A K]) }
    specify { expect(path).to eq(other_path) }
  end

  context 'when two paths have different letters' do
    let(:path) { GADDAG::Path.new(%w[B ♢ R E A K]) }
    let(:other_path) { GADDAG::Path.new(%w[C ♢ A R E]) }
    specify { expect(path).to_not eq(other_path) }
  end
end
