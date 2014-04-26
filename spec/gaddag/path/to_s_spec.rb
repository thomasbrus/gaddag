require 'gaddag'

describe GADDAG::Path, '#to_s' do
  context 'when the path is empty' do
    let(:path) { GADDAG::Path.new([]) }

    it 'returns an empty string' do
      expect(path.to_s).to be_empty
    end
  end

  context 'when the path is not empty' do
    let(:path) { GADDAG::Path.new(%w(B ♢ R E A K)) }

    it 'concatenates the letters in this path, delimited by \' > \'' do
      expect(path.to_s).to eq('B > ♢ > R > E > A > K')
    end
  end
end
