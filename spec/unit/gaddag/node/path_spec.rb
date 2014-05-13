# encoding: utf-8

require 'gaddag'

describe GADDAG::Node, '#path?' do
  subject { GADDAG::Node.new }
  let(:letters) { %w[A B C D] }

  context 'when a path exists for the given list of letters' do
    before { subject.create_path(letters) }

    it 'returns true' do
      expect(subject.path?(letters)).to eq(true)
    end
  end

  context 'when a path does not exist for the given list of letters' do
    it 'returns false' do
      expect(subject.path?(letters)).to eq(false)
    end

    context 'when the list of letters is empty' do
      let(:letters) { [] }

      it 'returns true' do
        expect(subject.path?(letters)).to eq(true)
      end
    end
  end
end
