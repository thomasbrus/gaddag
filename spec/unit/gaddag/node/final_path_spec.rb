# encoding: utf-8

require 'gaddag'

describe GADDAG::Node, '#final_path?' do
  subject { GADDAG::Node.new }
  let(:letters) { %w[A B C D] }

  context 'when a final path exists for the given list of letters' do
    before { subject.create_final_path(letters) }

    it 'returns true' do
      expect(subject.final_path?(letters)).to eq(true)
    end
  end

  context 'when a final path does not exist for the given list of letters' do
    it 'returns false' do
      expect(subject.final_path?(letters)).to eq(false)
    end

    context 'when the list of letters is empty' do
      let(:letters) { [] }

      it 'returns false' do
        expect(subject.final_path?(letters)).to eq(false)
      end
    end
  end
end
