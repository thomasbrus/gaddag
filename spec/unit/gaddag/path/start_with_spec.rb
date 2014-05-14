# encoding: utf-8

require 'gaddag'

describe GADDAG::Path, '#start_with?' do
  let(:letters) { %w[H E L] }

  context 'when a path starts with the given letters' do
    subject { GADDAG::Path.new(%w[H E L L O]) }

    it 'returns true' do
      expect(subject.start_with?(letters)).to eq(true)
    end
  end

  context 'when a path does not start with the given letters' do
    subject { GADDAG::Path.new(%w[B R E A K]) }

    it 'returns false' do
      expect(subject.start_with?(letters)).to eq(false)
    end

    context 'when the list of letters consists of nil values' do
      let(:letters) { [nil, nil, nil] }

      it 'returns true' do
        expect(subject.start_with?(letters)).to eq(true)
      end
    end

    context 'when the list of letters is empty' do
      let(:letters) { [] }

      it 'returns true' do
        expect(subject.start_with?(letters)).to eq(true)
      end
    end
  end
end
