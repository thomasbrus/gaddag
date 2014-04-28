# encoding: utf-8

require 'gaddag'

describe GADDAG::Node, '#find_final_paths' do
  subject { GADDAG::Node.new }
  let(:final_paths) { subject.find_final_paths }

  context 'when no paths have been created' do
    it 'returns an empty list' do
      expect(final_paths).to be_empty
    end
  end

  context 'when some paths have been created' do
    context 'when none of the paths are final' do
      before do
        subject.create_path(%w[K A E R B])
        subject.create_path(%w[A B C D])
      end

      it 'returns an empty list' do
        expect(final_paths).to be_empty
      end
    end

    context 'when some of the paths are final' do
      before do
        subject.create_path(%w[K A E R B])
        subject.create_final_path(%w[A B C D])
      end

      it 'returns the paths that are final' do
        expect(final_paths).to eq([GADDAG::Path.new(%w[A B C D])])
      end
    end

    context 'when two final paths exist for the same prefix' do
      before do
        subject.create_final_path(%w[F I N D])
        subject.create_final_path(%w[F I N D E R])
      end

      it 'returns both paths' do
        expect(final_paths).to match_array([
          GADDAG::Path.new(%w[F I N D]),
          GADDAG::Path.new(%w[F I N D E R]),
        ])
      end
    end
  end
end
